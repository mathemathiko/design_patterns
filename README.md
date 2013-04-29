## 「Rubyによるデザインパターン」

### 動的動機付け
* 渡されてくるオブジェクトが特定のクラスに属していないことを言語でチェックしないことを意味する
* テンプレートメソッドで言えば、クライアントが呼びだそうとしているメソッドをオブジェクトが実装していることが大事
* 型に対するこのアプローチはダックタイピングと呼ばれる

### ダックタイピング
* 「もしアヒルのように見えて、アヒルのように鳴くのなら、それはアヒルである」（"If it walks like a duck and quacks like a duck, it must be a duck."）

### GoF
* 変わるものを変わらないものから分離する
* インターフェイスに対してプログラムし、実装に対して行わない
* 継承より集約
* 委譲、委譲、委譲
* 必要になるまで作るな

### Template Method
* アルゴリズムに多様性を持たせたい場合に便利
* 変わるものと変わらないものを分離することができる
* 基底クラスに不変の部分を記述し、変わる部分はサブクラスに定義するメソッドにカプセル化する
* 基底クラスはメソッドを未定義にしておくことができる
* 未定義にする代わりに、基底クラスで標準実装を提供し、必要があればサブクラスでオーバーライドさせることもできる

### Strategy
* Strategyパターンは、Template Methodパターンと同様の問題に対する委譲ベースのアプローチによる解
* アルゴリズム中の変わる部分を抜き出してサブクラスへと押し込む代わりに、アルゴリズムのパターンごとにばらばらのオブジェクトとしてシンプルに実装
* 異なるストラテジオブジェクトをコンテキストに対して提供することで、アルゴリズムに多様性をもたらすことができる
* それぞれのストラテジオブジェクトは同じ仕事をこなすだけでなく、そのすべてが正確に同じインターフェイスを提供する
* 2つめ3つめのストラテジを設計に盛り込めないとStrategyパターンを利用する意味がないので、コンテキストとストラテジ間の結合度、インターフェイスの詳細には気を配る必要がある
* Observerパターンと類似しているが、Strategyパターンの背後にある動機は、アルゴリズムのバリエーションをどうやって演じたらよいかを知っているオブジェクトを提供すること

### Observer
* Observerパターンにより、他のコンポーネントの動きを監視するコンポーネントを作ることができる
* しかも、オブジェクト同士を強固に結合させることがないので、制御不能なスパゲッティプログラムにならなくて済む
* ニュースの発信源と消費者との間にきれいなインターフェースを作ることにより、Observerパターンはニュースをスムーズに受け渡すことができる
* Observerパターンの実装作業のほとんどは、サブジェクトクラス（オブザーバブルクラス）。スーパークラスまたはモジュールにより実現する。
* Strategyパターンでは何かの処理を行うためにそのストラテジオブジェクトを取得するのに対し、Observerパターンではオブザーバブルオブジェクトで発生しているイベントを他のオブジェクトに伝えるために利用される。
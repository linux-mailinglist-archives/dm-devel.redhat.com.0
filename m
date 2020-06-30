Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3520EBA6
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 04:52:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-FfrWoPMbMgymZ4xf62HdHA-1; Mon, 29 Jun 2020 22:52:54 -0400
X-MC-Unique: FfrWoPMbMgymZ4xf62HdHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F739464;
	Tue, 30 Jun 2020 02:52:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4CA5D9D3;
	Tue, 30 Jun 2020 02:52:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F0A9104918;
	Tue, 30 Jun 2020 02:52:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U2pT2J011197 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 22:51:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A212A2156A2D; Tue, 30 Jun 2020 02:51:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7982156A22
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 02:51:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E74B8EF3AE
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 02:51:27 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-414-6EW0u6cCP4CtgnqBQmF-lA-1; Mon, 29 Jun 2020 22:51:24 -0400
X-MC-Unique: 6EW0u6cCP4CtgnqBQmF-lA-1
IronPort-SDR: 4ZskCVDfo3z6xhWA6PRwangD7rG7NEbNXou7VQaDVlVwaJWOEK9/Rvl9rDKCoLl9xdfk/WHOnu
	yD5iMwBVttHrBF74vmjLZ5P6HuAH1zeK/vEt0/BRUdz727jQP/JbJUvXjafuy7pyPODB7XHQD+
	0Y2PR1AGegXFP3/IPOS1dBOta1Y4pAmSbiHl0eUFzqYrD+hpPQYaEEWqBG3wmKlcNiFWTbKZGX
	wyTzei15weSAulX5jyyzTEYdfHawM4RrE2zeGVdyLIMJ7nJQsPa89u6bR6m24T5ESQi9MllbSa
	glI=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="244255622"
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 10:51:23 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0344.namprd04.prod.outlook.com (2603:10b6:903:3d::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Tue, 30 Jun 2020 02:51:18 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3131.024;
	Tue, 30 Jun 2020 02:51:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>, 
	"snitzer@redhat.com" <snitzer@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v2] dm crypt: add flags to optionally bypass dm-crypt
	workqueues
Thread-Index: AQHWS/06zZqSdIYp0k2e+HMuy61K4w==
Date: Tue, 30 Jun 2020 02:51:17 +0000
Message-ID: <CY4PR04MB375127DC313F70875CAAC841E76F0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200626210302.1813-1-ignat@cloudflare.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e80392c4-baf8-4c0a-d942-08d81ca0767d
x-ms-traffictypediagnostic: CY4PR04MB0344:
x-microsoft-antispam-prvs: <CY4PR04MB034426204230AC8005A5F9F9E76F0@CY4PR04MB0344.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TjF2FTE9UXSX4z4I1Lpkysn3fakMekWB9+Yb0Fb7m3OIjffDYtdzfKqkq5ZtZJKELaThfMn/CEr0YmhX09m5c1+o41u1JesyfCW1/jrCpnEARGZGfP3WOhAuh3s5rigFOfOTqJoOqwEe9GhuUlCsgKuBZvLuGzfoQII6s1VUsnvmszFULPTj64aI8TulOShJdgbbE7etuWaf1L+ga9Yd6u6ywqDxJWT0GLAAFIk8FEkx3RO5QRRrl4FEob7hd+6ZS9bn12seW87Qn9ygpbfMhfN11pTSz3jAlBD9b/U53AU5aR2uzYonorVNmb0L+ztJQG7w/fAPlULM7d/BpKcbkmbCPOK9Gep1mgHhJ3Yohyhu9B5sI0dcFzvc02oW1TRs3jLSG2wUxoKgn4yxyHch1lz74Hw93W0ohV6fm4yZB8G+lZOZHTaxdV+oAvZY4wp+WUv+BUikO4fjmoiDzmTMfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(7696005)(71200400001)(2906002)(8936002)(316002)(30864003)(8676002)(83380400001)(186003)(19627235002)(91956017)(478600001)(33656002)(76116006)(9686003)(966005)(55016002)(66446008)(66476007)(64756008)(66556008)(54906003)(110136005)(7416002)(26005)(86362001)(53546011)(5660300002)(66946007)(52536014)(4326008)(6506007)(309714004);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: zpY7hNsdspqcvoHSjphPepW0KLq00ihTyXs3DozZIoxEGZr6OihadCS/dw+ObFatQQq3nOKE2bX7IhMPlJuFnkz9D/w4a46agkkh+qRKjjJjUmRsb2cA08FINBcJJUzGT4+QYToVGyY4iMLZ5vhXFJOxbYLaa9BtLtAuXibsYChWq6K/dn7mH+rTxZRoUpqtoi3gF6M95FSlBXWYD39IJT4iwlnN0TlbVbEiTXie4zXX0D7o8l9W1CzhOUlNVQygnuGSFWgsC4xwZH9j1j44jTYxn8fF8nJvf2+qWoavqn8YU3RQJ9LUATwfkPPTJa9iFSdVcXyAJpAQjVA4vbG+VScoEdq4+F0CBcIh5y+HPYNWa8uKPWee3gAZNgPladXqzhaDQzrAAsFJKGzB8r5mmfNh3pYo2MIo7eooNkqgiiMTXPdxy9zlPwdE/ozOz739eXKmq7WfRYgxcNVf4XnR1RMBjQ+5JFP0QWHI1fhTT94=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80392c4-baf8-4c0a-d942-08d81ca0767d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 02:51:17.9320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WDjtYWMUdCWgMVGSDLQyVGNY7doRZMbulOLZyNC/X/uwk6HY2BFWQbwkcaKnFD45xXoE94jScwserLmEugq9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0344
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05U2pT2J011197
X-loop: dm-devel@redhat.com
Cc: "ebiggers@kernel.org" <ebiggers@kernel.org>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>
Subject: Re: [dm-devel] [PATCH v2] dm crypt: add flags to optionally bypass
 dm-crypt workqueues
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/27 6:03, Ignat Korchagin wrote:
> This is a follow up from [1]. Consider the following script:
> 
> sudo modprobe brd rd_nr=1 rd_size=4194304
> 
> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | \
> sudo dmsetup create eram0
> 
> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 no_write_workqueue' | \
> sudo dmsetup create eram0-inline-write
> 
> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 no_read_workqueue' | \
> sudo dmsetup create eram0-inline-read
> 
> devices="/dev/ram0 /dev/mapper/eram0 /dev/mapper/eram0-inline-read "
> devices+="/dev/mapper/eram0-inline-write"
> 
> for dev in $devices; do
>   echo "reading from $dev"
>   sudo fio --filename=$dev --readwrite=read --bs=4k --direct=1 \
>   --loops=1000000 --runtime=3m --name=plain | grep READ
> done
> 
> for dev in $devices; do
>   echo "writing to $dev"
>   sudo fio --filename=$dev --readwrite=write --bs=4k --direct=1 \
>   --loops=1000000 --runtime=3m --name=plain | grep WRITE
> done
> 
> This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
> three dm-crypt instances on top. All dm-crypt instances use the NULL cipher
> to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
> for "encyption"). The first instance is the current dm-crypt implementation from
> 5.8-rc2, the two others have new optional flags enabled, which bypass kcryptd
> workqueues for reads and writes respectively and write sorting for writes. On
> my VM (Debian in VirtualBox with 4 cores on 2.8 GHz Quad-Core Intel Core i7) I
> get the following output (formatted for better readability):
> 
> reading from /dev/ram0
>    READ: bw=508MiB/s (533MB/s), 508MiB/s-508MiB/s (533MB/s-533MB/s), io=89.3GiB (95.9GB), run=180000-180000msec
> 
> reading from /dev/mapper/eram0
>    READ: bw=80.6MiB/s (84.5MB/s), 80.6MiB/s-80.6MiB/s (84.5MB/s-84.5MB/s), io=14.2GiB (15.2GB), run=180000-180000msec
> 
> reading from /dev/mapper/eram0-inline-read
>    READ: bw=295MiB/s (309MB/s), 295MiB/s-295MiB/s (309MB/s-309MB/s), io=51.8GiB (55.6GB), run=180000-180000msec
> 
> reading from /dev/mapper/eram0-inline-write
>    READ: bw=114MiB/s (120MB/s), 114MiB/s-114MiB/s (120MB/s-120MB/s), io=20.1GiB (21.5GB), run=180000-180000msec
> 
> writing to /dev/ram0
>   WRITE: bw=516MiB/s (541MB/s), 516MiB/s-516MiB/s (541MB/s-541MB/s), io=90.7GiB (97.4GB), run=180001-180001msec
> 
> writing to /dev/mapper/eram0
>   WRITE: bw=40.4MiB/s (42.4MB/s), 40.4MiB/s-40.4MiB/s (42.4MB/s-42.4MB/s), io=7271MiB (7624MB), run=180001-180001msec
> 
> writing to /dev/mapper/eram0-inline-read
>   WRITE: bw=38.9MiB/s (40.8MB/s), 38.9MiB/s-38.9MiB/s (40.8MB/s-40.8MB/s), io=7000MiB (7340MB), run=180001-180001msec
> 
> writing to /dev/mapper/eram0-inline-write
>   WRITE: bw=277MiB/s (290MB/s), 277MiB/s-277MiB/s (290MB/s-290MB/s), io=48.6GiB (52.2GB), run=180000-180000msec
> 
> Current dm-crypt implementation creates a significant IO performance overhead
> (at least on small IO block sizes) for both latency and throughput. We suspect
> offloading IO request processing into workqueues and async threads is more
> harmful these days with the modern fast storage. I also did some digging into
> the dm-crypt git history and much of this async processing is not needed
> anymore, because the reasons it was added are mostly gone from the kernel. More
> details can be found in [2] (see "Git archeology" section).
> 
> This change adds no_(read|write)_workqueue flags separately for read and write
> BIOs, which direct dm-crypt not to offload crypto operations into kcryptd
> workqueues and process everything inline. In addition, writes are not buffered
> to be sorted in the dm-crypt red-black tree, but dispatched immediately. For
> cases, where crypto operations cannot happen inline (hard interrupt context,
> for example the read path of some NVME drivers), we offload the work to a
> tasklet rather than a workqueue.
> 
> These flags ensure inline BIO processing in the dm-crypt module only. It is
> worth noting that some Crypto API implementations may offload encryption into
> their own workqueues, which are independent of the dm-crypt and its
> configuration. However upon enabling no_(read|write)_workqueue flags dm-crypt
> will instruct Crypto API not to backlog crypto requests.
> 
> [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
> [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> 
> Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
> ---
>  drivers/md/dm-crypt.c | 68 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 52 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 000ddfab5ba0..6924eb49b1df 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -69,6 +69,7 @@ struct dm_crypt_io {
>  	u8 *integrity_metadata;
>  	bool integrity_metadata_from_pool;
>  	struct work_struct work;
> +	struct tasklet_struct tasklet;
>  
>  	struct convert_context ctx;
>  
> @@ -127,7 +128,8 @@ struct iv_elephant_private {
>   * and encrypts / decrypts at the same time.
>   */
>  enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
> -	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
> +	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD,
> +	     DM_CRYPT_NO_READ_WORKQUEUE, DM_CRYPT_NO_WRITE_WORKQUEUE };

I liked the "INLINE" naming. What about DM_CRYPT_READ_INLINE and
DM_CRYPT_WRITE_INLINE ? Shorter too :)

But from the changes below, it looks like your change is now less about being
purely inline or synchronous but about bypassing the workqueue.
Is this correct ?

>  
>  enum cipher_flags {
>  	CRYPT_MODE_INTEGRITY_AEAD,	/* Use authenticated mode for cihper */
> @@ -1449,7 +1451,7 @@ static void kcryptd_async_done(struct crypto_async_request *async_req,
>  			       int error);
>  
>  static void crypt_alloc_req_skcipher(struct crypt_config *cc,
> -				     struct convert_context *ctx)
> +				     struct convert_context *ctx, bool nobacklog)
>  {
>  	unsigned key_index = ctx->cc_sector & (cc->tfms_count - 1);
>  
> @@ -1463,12 +1465,12 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>  	 * requests if driver request queue is full.
>  	 */
>  	skcipher_request_set_callback(ctx->r.req,
> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
> +	    nobacklog ? 0 : CRYPTO_TFM_REQ_MAY_BACKLOG,
>  	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));

Will not specifying CRYPTO_TFM_REQ_MAY_BACKLOG always cause the crypto API to
return -EBUSY ? From the comment above the skcipher_request_set_callback(), it
seems that this will be the case only if the skcipher diver queue is full. So in
other word, keeping the kcryptd_async_done() callback and executing the skcipher
request through crypt_convert() and crypt_convert_block_skcipher() may still end
up being an asynchronous operation. Can you confirm this and is it what you
intended to implement ?

>From my understanding of the crypto API, and from what Eric commented, a truly
synchronous/inline execution of the skcypher needs a call like:

crypto_wait_req(crypto_skcipher_encrypt(req), &wait);

For SMR use case were we must absolutely preserve the write requests order, the
above change will probably be needed. Will check again.

>  }
>  
>  static void crypt_alloc_req_aead(struct crypt_config *cc,
> -				 struct convert_context *ctx)
> +				 struct convert_context *ctx, bool nobacklog)
>  {
>  	if (!ctx->r.req_aead)
>  		ctx->r.req_aead = mempool_alloc(&cc->req_pool, GFP_NOIO);
> @@ -1480,17 +1482,17 @@ static void crypt_alloc_req_aead(struct crypt_config *cc,
>  	 * requests if driver request queue is full.
>  	 */
>  	aead_request_set_callback(ctx->r.req_aead,
> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
> +	    nobacklog ? 0 : CRYPTO_TFM_REQ_MAY_BACKLOG,
>  	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req_aead));
>  }
>  
>  static void crypt_alloc_req(struct crypt_config *cc,
> -			    struct convert_context *ctx)
> +			    struct convert_context *ctx, bool nobacklog)
>  {
>  	if (crypt_integrity_aead(cc))
> -		crypt_alloc_req_aead(cc, ctx);
> +		crypt_alloc_req_aead(cc, ctx, nobacklog);
>  	else
> -		crypt_alloc_req_skcipher(cc, ctx);
> +		crypt_alloc_req_skcipher(cc, ctx, nobacklog);
>  }
>  
>  static void crypt_free_req_skcipher(struct crypt_config *cc,
> @@ -1523,7 +1525,7 @@ static void crypt_free_req(struct crypt_config *cc, void *req, struct bio *base_
>   * Encrypt / decrypt data from one bio to another one (can be the same one)
>   */
>  static blk_status_t crypt_convert(struct crypt_config *cc,
> -			 struct convert_context *ctx)
> +			 struct convert_context *ctx, bool noresched)

"noresched" is named after what will happen, not after the reason for it. So to
clarify, why not rename this as "convert_inline" or "do_inline" ?

>  {
>  	unsigned int tag_offset = 0;
>  	unsigned int sector_step = cc->sector_size >> SECTOR_SHIFT;
> @@ -1533,7 +1535,7 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>  
>  	while (ctx->iter_in.bi_size && ctx->iter_out.bi_size) {
>  
> -		crypt_alloc_req(cc, ctx);
> +		crypt_alloc_req(cc, ctx, noresched);
>  		atomic_inc(&ctx->cc_pending);
>  
>  		if (crypt_integrity_aead(cc))
> @@ -1566,7 +1568,8 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>  			atomic_dec(&ctx->cc_pending);
>  			ctx->cc_sector += sector_step;
>  			tag_offset++;
> -			cond_resched();
> +			if (!noresched)
> +				cond_resched();
>  			continue;
>  		/*
>  		 * There was a data integrity error.
> @@ -1879,6 +1882,9 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
>  	unsigned long flags;
>  	sector_t sector;
>  	struct rb_node **rbp, *parent;
> +	bool nosort =
> +			(likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) ||
> +			test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);

"nosort" is a little obscure as a name. Why not just "do_inline" ? In any case,
since this bool is used only in the if below, you could just write the condition
directly there.

>  
>  	if (unlikely(io->error)) {
>  		crypt_free_buffer_pages(cc, clone);
> @@ -1892,7 +1898,7 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
>  
>  	clone->bi_iter.bi_sector = cc->start + io->sector;
>  
> -	if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {
> +	if (nosort) {
>  		generic_make_request(clone);
>  		return;
>  	}
> @@ -1941,7 +1947,7 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
>  	sector += bio_sectors(clone);
>  
>  	crypt_inc_pending(io);
> -	r = crypt_convert(cc, &io->ctx);
> +	r = crypt_convert(cc, &io->ctx, test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags));
>  	if (r)
>  		io->error = r;
>  	crypt_finished = atomic_dec_and_test(&io->ctx.cc_pending);
> @@ -1971,7 +1977,7 @@ static void kcryptd_crypt_read_convert(struct dm_crypt_io *io)
>  	crypt_convert_init(cc, &io->ctx, io->base_bio, io->base_bio,
>  			   io->sector);
>  
> -	r = crypt_convert(cc, &io->ctx);
> +	r = crypt_convert(cc, &io->ctx, test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags));
>  	if (r)
>  		io->error = r;
>  
> @@ -2031,9 +2037,29 @@ static void kcryptd_crypt(struct work_struct *work)
>  		kcryptd_crypt_write_convert(io);
>  }
>  
> +static void kcryptd_crypt_tasklet(unsigned long work)
> +{
> +	kcryptd_crypt((struct work_struct *)work);
> +}
> +
>  static void kcryptd_queue_crypt(struct dm_crypt_io *io)
>  {
>  	struct crypt_config *cc = io->cc;
> +	bool noworkqueue =
> +			(bio_data_dir(io->base_bio) == READ && test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags)) ||
> +			(bio_data_dir(io->base_bio) == WRITE && test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags));

Since this variable is used only in the if statement bleow, why not used the
condition directly in that statement ?

> +
> +	if (noworkqueue) {
> +		if (in_irq()) {
> +			/* Crypto API's "skcipher_walk_first() refuses to work in hard IRQ context */
> +			tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
> +			tasklet_schedule(&io->tasklet);
> +			return;
> +		}
> +
> +		kcryptd_crypt(&io->work);
> +		return;
> +	}
>  
>  	INIT_WORK(&io->work, kcryptd_crypt);
>  	queue_work(cc->crypt_queue, &io->work);
> @@ -2838,7 +2864,7 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>  	struct crypt_config *cc = ti->private;
>  	struct dm_arg_set as;
>  	static const struct dm_arg _args[] = {
> -		{0, 6, "Invalid number of feature args"},
> +		{0, 8, "Invalid number of feature args"},
>  	};
>  	unsigned int opt_params, val;
>  	const char *opt_string, *sval;
> @@ -2868,6 +2894,10 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>  
>  		else if (!strcasecmp(opt_string, "submit_from_crypt_cpus"))
>  			set_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
> +		else if (!strcasecmp(opt_string, "no_read_workqueue"))
> +			set_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags);
> +		else if (!strcasecmp(opt_string, "no_write_workqueue"))
> +			set_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
>  		else if (sscanf(opt_string, "integrity:%u:", &val) == 1) {
>  			if (val == 0 || val > MAX_TAG_SIZE) {
>  				ti->error = "Invalid integrity arguments";
> @@ -3196,6 +3226,8 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>  		num_feature_args += !!ti->num_discard_bios;
>  		num_feature_args += test_bit(DM_CRYPT_SAME_CPU, &cc->flags);
>  		num_feature_args += test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
> +		num_feature_args += test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags);
> +		num_feature_args += test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
>  		num_feature_args += cc->sector_size != (1 << SECTOR_SHIFT);
>  		num_feature_args += test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags);
>  		if (cc->on_disk_tag_size)
> @@ -3208,6 +3240,10 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>  				DMEMIT(" same_cpu_crypt");
>  			if (test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags))
>  				DMEMIT(" submit_from_crypt_cpus");
> +			if (test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags))
> +				DMEMIT(" no_read_workqueue");
> +			if (test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags))
> +				DMEMIT(" no_write_workqueue");
>  			if (cc->on_disk_tag_size)
>  				DMEMIT(" integrity:%u:%s", cc->on_disk_tag_size, cc->cipher_auth);
>  			if (cc->sector_size != (1 << SECTOR_SHIFT))
> @@ -3320,7 +3356,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  
>  static struct target_type crypt_target = {
>  	.name   = "crypt",
> -	.version = {1, 21, 0},
> +	.version = {1, 22, 0},
>  	.module = THIS_MODULE,
>  	.ctr    = crypt_ctr,
>  	.dtr    = crypt_dtr,
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


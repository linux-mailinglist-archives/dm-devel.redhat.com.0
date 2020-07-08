Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 95C0F217C39
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 02:29:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-TdfMTQmNPw642Dz82kuzTw-1; Tue, 07 Jul 2020 20:29:05 -0400
X-MC-Unique: TdfMTQmNPw642Dz82kuzTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5A0380183C;
	Wed,  8 Jul 2020 00:28:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A7674191;
	Wed,  8 Jul 2020 00:28:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FA7A6C9E5;
	Wed,  8 Jul 2020 00:28:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0680RTJi031398 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 20:27:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA76F2026D69; Wed,  8 Jul 2020 00:27:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 938972026D5D
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:27:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1DBC8EF3A1
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:27:27 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-258-jJZ9lM8RNf63FxXai6oiAg-1; Tue, 07 Jul 2020 20:27:23 -0400
X-MC-Unique: jJZ9lM8RNf63FxXai6oiAg-1
IronPort-SDR: akGdouwTrqx3pEetlIsMwTlLT4JJjn9g6D2htd94ATamy723dd4IHSvjXJCq3/Hi1MvjCFXxxC
	6b/kvvhOBwhyBi4HXCn15gmjsHb0MdxHzPtwO9QQQ2QsRcdfBFO4EcmtYaCguzV6bGi0hL0vol
	C2UmnZimZkkNcBCHUtfsEIGl5a6UaC4m0xBFj6vFTzComSvzwmWrgnQ0sK4gXzHm6PqQRG5QgB
	en/2ymLJr91QKWQpAvun7PsPdz+aI6Bws88TPlccfFEPKT69GEC01P25AkCQZ7pP4t2v+A3WE3
	f1Q=
X-IronPort-AV: E=Sophos;i="5.75,325,1589212800"; d="scan'208";a="141873455"
Received: from mail-bn3nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.57])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 08:27:20 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0345.namprd04.prod.outlook.com (2603:10b6:903:42::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29;
	Wed, 8 Jul 2020 00:27:19 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3153.022;
	Wed, 8 Jul 2020 00:27:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>, 
	"snitzer@redhat.com" <snitzer@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v3] dm crypt: add flags to optionally bypass dm-crypt
	workqueues
Thread-Index: AQHWU7wsoGv4+8zxMkW3behQE8/HHQ==
Date: Wed, 8 Jul 2020 00:27:18 +0000
Message-ID: <CY4PR04MB375107B8F7E8EE29854408E1E7670@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200706173731.3734-1-ignat@cloudflare.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c446a094-8fb8-4bd7-ac1f-08d822d5ac74
x-ms-traffictypediagnostic: CY4PR04MB0345:
x-microsoft-antispam-prvs: <CY4PR04MB0345C992C5D8B5C44E8319C7E7670@CY4PR04MB0345.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFNxd1AutUo/UOPW4P+j+F/6qtZe6BHEwSdzq96DX2kaJ+yYPCvGNMw34bvyY+AVjePK6iQDP425cGwcy8wWYw9kxs+Sb3C8agtxCwt4OrWjMfcs/z5dE/hTt1oUifZAcjhjIQMQ5m0RV6ziMll44aVplPllRC3NxHmLzYnfSHmXzzyAtr9CjGWPKmYzoM8e4ymEgZd8Gp/mtiJ/eDc9OA7R5Lg11ZvkbPG74z3POzemjdaKujx/K53gUrB2ixqvVs2bk4l8zmC2FsyRrnOh+G3lPio+xLDnTCO0ZfrSVxRM4V583ddAXWMnMGqwH0omr6AhTWiqH4ynus9KWlCNcgXaZzA3oiVHp0I5HAJ6+p/g7BIos13S+hzm1Co7e1lZbbHDC87qXXpMRIIkRi7rz0wrfW7sTSHy2ljYUeU7yKz6Q4VWdZJs3LCzby7nx43HvQtmKWDzp0FpDFVjXKe4HQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(71200400001)(186003)(53546011)(7416002)(2906002)(83380400001)(6506007)(66476007)(66446008)(52536014)(64756008)(66946007)(66556008)(30864003)(9686003)(19627235002)(55016002)(86362001)(26005)(76116006)(91956017)(8676002)(33656002)(478600001)(8936002)(7696005)(5660300002)(4326008)(966005)(54906003)(110136005)(316002)(309714004);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: rYibXT084vAXgtgQaPOXbWVjUgWWXYWbQwrBIXB54MjKYBliEpYgfOn85CWMcMQXBv98I1cABsQ4qpWop8Ddx6IzM4+VhKsD3zuIImzAFmvqgVNLzp3rLhdkelEbcVhB7pj7O5rJwDoR5sbWSTo4qM6ccT0e4yv7/WvTeE2EjFWcznPh29nbUIHsz8TuGVngX/UfXQEgNBwHP9HOChnXWfKVuXXYYT1GsK568wXmSj7SGjc5h+q13NycLGvEG7Pmmn3JH7wqvfWfEp2toBn/27qBOnE9h3Bkt96o2Ru5HJWSSU1bnt87erHVGhFjBI2dXDj5B5qgXJilwqtqSiWUPacloYoC7AXvBEH9vqzkrKK/7ELaVr9Ta3eIRyGun2AUxA0bu3lTI79xDiJMzT2Ks5/0VzAZ9mV9qHOlnNz9KWTKQsluyRt/istuXtGHcd9Tx7wTIyngKCX2gZPkBnfrnxZaNyFeJ1mU/NaXSwE3jHyUP++ygbal4AJNdLXZ16zw
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c446a094-8fb8-4bd7-ac1f-08d822d5ac74
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 00:27:18.7162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc8nMTQwPOE0AlJmj5qoRTfHnfL89KJlbe0zpfwqI3xJRYGeiSki0o7vmrFmgkjPwOEa9y3XgDr85+hERQGFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0345
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0680RTJi031398
X-loop: dm-devel@redhat.com
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"nobuto.murata@canonical.com" <nobuto.murata@canonical.com>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"bob.liu@oracle.com" <bob.liu@oracle.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH v3] dm crypt: add flags to optionally bypass
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/07 2:37, Ignat Korchagin wrote:
> Changes from v2:
>   * dropped nobacklog boolean - ciphers are OK to backlog requests
>   * moved some conditionals inline dropping the extra local variables
>   * renamed "noresched" -> "atomic"
> 
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
>  drivers/md/dm-crypt.c | 50 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 42 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 000ddfab5ba0..7536ecb2c95d 100644
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
>  
>  enum cipher_flags {
>  	CRYPT_MODE_INTEGRITY_AEAD,	/* Use authenticated mode for cihper */
> @@ -1523,7 +1525,7 @@ static void crypt_free_req(struct crypt_config *cc, void *req, struct bio *base_
>   * Encrypt / decrypt data from one bio to another one (can be the same one)
>   */
>  static blk_status_t crypt_convert(struct crypt_config *cc,
> -			 struct convert_context *ctx)
> +			 struct convert_context *ctx, bool atomic)
>  {
>  	unsigned int tag_offset = 0;
>  	unsigned int sector_step = cc->sector_size >> SECTOR_SHIFT;
> @@ -1566,7 +1568,8 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>  			atomic_dec(&ctx->cc_pending);
>  			ctx->cc_sector += sector_step;
>  			tag_offset++;
> -			cond_resched();
> +			if (!atomic)
> +				cond_resched();
>  			continue;
>  		/*
>  		 * There was a data integrity error.
> @@ -1892,7 +1895,8 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
>  
>  	clone->bi_iter.bi_sector = cc->start + io->sector;
>  
> -	if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {
> +	if ((likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) ||
> +	    test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags)) {
>  		generic_make_request(clone);
>  		return;
>  	}
> @@ -1941,7 +1945,8 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
>  	sector += bio_sectors(clone);
>  
>  	crypt_inc_pending(io);
> -	r = crypt_convert(cc, &io->ctx);
> +	r = crypt_convert(cc, &io->ctx,
> +			  test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags));
>  	if (r)
>  		io->error = r;
>  	crypt_finished = atomic_dec_and_test(&io->ctx.cc_pending);
> @@ -1971,7 +1976,8 @@ static void kcryptd_crypt_read_convert(struct dm_crypt_io *io)
>  	crypt_convert_init(cc, &io->ctx, io->base_bio, io->base_bio,
>  			   io->sector);
>  
> -	r = crypt_convert(cc, &io->ctx);
> +	r = crypt_convert(cc, &io->ctx,
> +			  test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags));
>  	if (r)
>  		io->error = r;
>  
> @@ -2031,10 +2037,28 @@ static void kcryptd_crypt(struct work_struct *work)
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
>  
> +	if ((bio_data_dir(io->base_bio) == READ && test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags)) ||
> +	    (bio_data_dir(io->base_bio) == WRITE && test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags))) {
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
> +
>  	INIT_WORK(&io->work, kcryptd_crypt);
>  	queue_work(cc->crypt_queue, &io->work);
>  }
> @@ -2838,7 +2862,7 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>  	struct crypt_config *cc = ti->private;
>  	struct dm_arg_set as;
>  	static const struct dm_arg _args[] = {
> -		{0, 6, "Invalid number of feature args"},
> +		{0, 8, "Invalid number of feature args"},
>  	};
>  	unsigned int opt_params, val;
>  	const char *opt_string, *sval;
> @@ -2868,6 +2892,10 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
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
> @@ -3196,6 +3224,8 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>  		num_feature_args += !!ti->num_discard_bios;
>  		num_feature_args += test_bit(DM_CRYPT_SAME_CPU, &cc->flags);
>  		num_feature_args += test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
> +		num_feature_args += test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags);
> +		num_feature_args += test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
>  		num_feature_args += cc->sector_size != (1 << SECTOR_SHIFT);
>  		num_feature_args += test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags);
>  		if (cc->on_disk_tag_size)
> @@ -3208,6 +3238,10 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
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
> @@ -3320,7 +3354,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  
>  static struct target_type crypt_target = {
>  	.name   = "crypt",
> -	.version = {1, 21, 0},
> +	.version = {1, 22, 0},
>  	.module = THIS_MODULE,
>  	.ctr    = crypt_ctr,
>  	.dtr    = crypt_dtr,
> 

Looks good to me. I am using this patch to rebase the SMR disk support. The
separation of the read and write flags simplifies that support.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


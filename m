Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB2B8170D1D
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 01:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582762878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q+JudLyey9fEaZwJREMKnVs01UM5X5grW0oC3gietGk=;
	b=KqlS85Bu7sgGHNsVQwo8c+oCZcgBhay3jA4VBe4l6/E7ttCXBegkMTJxuVtcZ3mqAnYwcr
	r09LBo2XsMXP4ZZaS6/IrcOEVEsjswYK4YzKcELmgp36AcMLshXnMQDgSSB38m6UXwpu7k
	CMBPEFXWjTrGlM5OP1TopJ6tBoL/hzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-0sejS__ONbqqjpsz37JUJA-1; Wed, 26 Feb 2020 19:21:16 -0500
X-MC-Unique: 0sejS__ONbqqjpsz37JUJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C584D13E5;
	Thu, 27 Feb 2020 00:21:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E4A100E7E3;
	Thu, 27 Feb 2020 00:21:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 036D518089CD;
	Thu, 27 Feb 2020 00:21:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01R0KqnU017367 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 19:20:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DB65120267F2; Thu, 27 Feb 2020 00:20:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D57C92026D69
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 00:20:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A997B8007AC
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 00:20:50 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-77-HsFxN3YsO1eSoRTlJGGWgw-1; Wed, 26 Feb 2020 19:20:46 -0500
X-MC-Unique: HsFxN3YsO1eSoRTlJGGWgw-1
IronPort-SDR: CSkRJw/YybNjJTqu8UDXC1ZFoMYh8RrOYdsduQVvzT8jhJopoaEEID9AV7Ppi+S8B5OdNWRbJF
	U8Dmj8DOoM8nhuITfhslYDpVaqcBng1rC28tJcK6L85GHf4u/8wPk2AtwPh4c1hEhnmaV4WOao
	Z91ZNsjbNBzP2cCa4IjxGGFWfx5N7Ree/jDx8c3L4iPsdjGpp22lQsLdP2pE9gJ9xNdBpqWnIy
	VETCM6Xaw4oiXE50hlwXZP6+WHA1InOe/d0ucPFojsX+eQjlTOuA4lBQxxCs3vEKNAj/Cwga//
	5Fg=
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="130845439"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
	by ob1.hgst.iphmx.com with ESMTP; 27 Feb 2020 08:20:45 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (2603:10b6:a03:10e::16)
	by BYAPR04MB4422.namprd04.prod.outlook.com (2603:10b6:a03::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2750.22; Thu, 27 Feb 2020 00:20:44 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::6daf:1b7c:1a61:8cb2]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::6daf:1b7c:1a61:8cb2%6]) with mapi id 15.20.2772.012;
	Thu, 27 Feb 2020 00:20:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm zoned: Fix reference counter initial value of chunk
	works
Thread-Index: AQHV7QOAUumt4z+SjkCrdLpDnnxvZA==
Date: Thu, 27 Feb 2020 00:20:44 +0000
Message-ID: <BYAPR04MB58167D20A8333523AEE96362E7EB0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20200227001852.287194-1-shinichiro.kawasaki@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45cf86d7-cbf4-4b82-ad57-08d7bb1ae2c1
x-ms-traffictypediagnostic: BYAPR04MB4422:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB44223416B044A78499C9D886E7EB0@BYAPR04MB4422.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:451;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(189003)(199004)(316002)(55016002)(8676002)(110136005)(66946007)(86362001)(52536014)(76116006)(45080400002)(9686003)(81156014)(53546011)(450100002)(478600001)(5660300002)(6506007)(81166006)(2906002)(71200400001)(64756008)(7696005)(66446008)(66476007)(66556008)(26005)(33656002)(8936002)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4422;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HhCHZBxVqHfgvuGb7Q1z1/E3W4aXIEsHa12MnaJUctg+wAtSiF1P3IXMRsiiPy/uEGkbrAdOtfFnpsYYb9pydwAkGjoFMqV3dNGlRenFNuJdAUqIJL1j0VapeMmbuLVz+ZlvwToOvxvEr9xnU3BhHi0YZtboJdz8+4s3kliHM9htBlZBsR0QIvz7p5CMAFViKbhJlxs005PpBlRSgDJtnP9T/ObJpDXx44s0mL04HNu+HOBVYi0yEKiFceY7/w3rPOGoN3iuVrZXCm0x5a++4BA4tj1wdugqEhJvNY8U39JlB4iD+Q31TYaRtGKVqlm6xawDKKdV9LofdqwHmiUDJF+BwtHQn4/Ll+t8aojk7ecvOPgjr4PpXDt0LP2Ez78bwo3gwWtrxQv1bEneBxn84yw8B4RckMCDybNypGg8mIzLHAYbYbgTcaYykND1IDnZ
x-ms-exchange-antispam-messagedata: 6c4zzIvyYbx39PrPBvAu7mO755KWcRjg+kG1ETSTPUYaa/ZpXY0Gl3vGWBlsssuzmqUnqxwcih+Vy76RzC3eILebYCwTbNNAXlF3agGMitHf8O/TPJpRoyrHniSMMZk27pRGDRVfv5NjpptND9B7Nw==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cf86d7-cbf4-4b82-ad57-08d7bb1ae2c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 00:20:44.2303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1txZqd7+Epl3bUXnogl000v9MDQiTP6ej1l7SBheS39zibTRAo3FCGceG2bgSOOL33rViWo9k/pb/x+eo1zow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4422
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01R0KqnU017367
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm zoned: Fix reference counter initial
 value of chunk works
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/02/27 9:18, Shin'ichiro Kawasaki wrote:
> Dm-zoned initializes reference counters of new chunk works with zero
> value and refcount_inc() is called to increment the counter. However, the
> refcount_inc() function handles the addition to zero value as an error
> and triggers the warning as follows:
> 
> refcount_t: addition on 0; use-after-free.
> WARNING: CPU: 7 PID: 1506 at lib/refcount.c:25 refcount_warn_saturate+0x68/0xf0
> Modules linked in: dm_zoned bridge stp llc rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache nf_conntrack_netbios_ns nf_o
> CPU: 7 PID: 1506 Comm: systemd-udevd Not tainted 5.4.0+ #134
> ...
> Call Trace:
>  dmz_map+0x2d2/0x350 [dm_zoned]
>  __map_bio+0x42/0x1a0
>  __split_and_process_non_flush+0x14a/0x1b0
>  __split_and_process_bio+0x83/0x240
>  ? kmem_cache_alloc+0x165/0x220
>  dm_process_bio+0x90/0x230
>  ? generic_make_request_checks+0x2e7/0x680
>  dm_make_request+0x3e/0xb0
>  generic_make_request+0xcf/0x320
>  ? memcg_drain_all_list_lrus+0x1c0/0x1c0
>  submit_bio+0x3c/0x160
>  ? guard_bio_eod+0x2c/0x130
>  mpage_readpages+0x182/0x1d0
>  ? bdev_evict_inode+0xf0/0xf0
>  read_pages+0x6b/0x1b0
>  __do_page_cache_readahead+0x1ba/0x1d0
>  force_page_cache_readahead+0x93/0x100
>  generic_file_read_iter+0x83a/0xe40
>  ? __seccomp_filter+0x7b/0x670
>  new_sync_read+0x12a/0x1c0
>  vfs_read+0x9d/0x150
>  ksys_read+0x5f/0xe0
>  do_syscall_64+0x5b/0x180
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> ...
> 
> After this warning, following refcount API calls for the counter all fail
> to change the counter value.
> 
> Fix this by setting the initial reference counter value not zero but one
> for the new chunk works. Instead, do not call refcount_inc() via
> dmz_get_chunk_work() for the new chunks works.
> 
> The failure was observed with linux version 5.4 with CONFIG_REFCOUNT_FULL
> enabled. Refcount rework was merged to linux version 5.5 by the
> commit 168829ad09ca ("Merge branch 'locking-core-for-linus' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip"). After this
> commit, CONFIG_REFCOUNT_FULL was removed and the failure was observed
> regardless of kernel configuration.
> 
> Linux version 4.20 merged the commit 092b5648760a ("dm zoned: target: use
> refcount_t for dm zoned reference counters"). Before this commit, dm
> zoned used atomic_t APIs which does not check addition to zero, then this
> fix is not necessary.
> 
> Fixes: 092b5648760a ("dm zoned: target: use refcount_t for dm zoned reference counters")
> Cc: stable@vger.kernel.org # 5.5
> Cc: stable@vger.kernel.org # 5.4
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


> ---
>  drivers/md/dm-zoned-target.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 70a1063161c0..b1e64cd31647 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -533,8 +533,9 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  
>  	/* Get the BIO chunk work. If one is not active yet, create one */
>  	cw = radix_tree_lookup(&dmz->chunk_rxtree, chunk);
> -	if (!cw) {
> -
> +	if (cw) {
> +		dmz_get_chunk_work(cw);
> +	} else {
>  		/* Create a new chunk work */
>  		cw = kmalloc(sizeof(struct dm_chunk_work), GFP_NOIO);
>  		if (unlikely(!cw)) {
> @@ -543,7 +544,7 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  		}
>  
>  		INIT_WORK(&cw->work, dmz_chunk_work);
> -		refcount_set(&cw->refcount, 0);
> +		refcount_set(&cw->refcount, 1);
>  		cw->target = dmz;
>  		cw->chunk = chunk;
>  		bio_list_init(&cw->bio_list);
> @@ -556,7 +557,6 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  	}
>  
>  	bio_list_add(&cw->bio_list, bio);
> -	dmz_get_chunk_work(cw);
>  
>  	dmz_reclaim_bio_acc(dmz->reclaim);
>  	if (queue_work(dmz->chunk_wq, &cw->work))
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


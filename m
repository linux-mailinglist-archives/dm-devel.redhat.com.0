Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEB5206B8C
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 07:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592975590;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FQqKNfRJDvJvbYfCcPymMwSJnvc15flutga86XLzq+A=;
	b=XAaFsokbfFUQ9fYqLtEGWMfxWsrbA6yU8c7CxThYA5T5r33C6q62mDJmkQt0UAZiyMlyPU
	zBgbDY8EYNRO7I62s+3IpoyyM7b6EDt0MzLQfw5sH6vPbMVohKILMN71+AASED5mr/toTc
	PST51IIq9So749h2jBVxjM51jipwquc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-JWsI3NtSPpyixP0Ea1BSug-1; Wed, 24 Jun 2020 01:13:07 -0400
X-MC-Unique: JWsI3NtSPpyixP0Ea1BSug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F52D18A8226;
	Wed, 24 Jun 2020 05:13:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8777E60C80;
	Wed, 24 Jun 2020 05:13:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82AF7833D3;
	Wed, 24 Jun 2020 05:12:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O5Cpdv019047 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 01:12:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 984EC20234B0; Wed, 24 Jun 2020 05:12:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92DFD20234B2
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:12:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C65A0185A78B
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:12:48 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-197-Rc8jXbpNO1uH7YfFt9tJrg-1; Wed, 24 Jun 2020 01:12:43 -0400
X-MC-Unique: Rc8jXbpNO1uH7YfFt9tJrg-1
IronPort-SDR: y4tGI7w3zBugVQ7ebPCRHmHsq9ytTvuQxZBYzxZXvjjZjtB//XvyThr92lbSrk8BsGs+r0er1D
	s84+3kcdTo8YxspGI1Zm6Zvk8NkjR5qLwbLLp+RF5nNXjCI8X+CdtXqdknQZPG3sLETeiobD0L
	mhds39IRpr2/qrJCxzNfHu1jiWyWDV+JdO/js7HEjeQysoCJ85pi2wu+T0DarpPQhDrV1Ox7XB
	y/nhbopTUmuGqgxt2HfPZ4cWfd4acUaxZLPvRxzpyWnbacoZ7V8jZgMJuba9WUths1sAMZEp1e
	xqc=
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; d="scan'208";a="141007286"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 13:12:42 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1030.namprd04.prod.outlook.com (2603:10b6:910:56::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24;
	Wed, 24 Jun 2020 05:12:40 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 05:12:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>, 
	"snitzer@redhat.com" <snitzer@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, "dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Thread-Topic: [dm-devel] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE flag to
	dm-crypt target
Thread-Index: AQHWSeYV77vE9ehTTUSGmjh9RgGvoA==
Date: Wed, 24 Jun 2020 05:12:40 +0000
Message-ID: <CY4PR04MB375140A86968BAEA71C8EDDFE7950@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec5941ca-0d5a-47d7-a1d9-08d817fd37c1
x-ms-traffictypediagnostic: CY4PR04MB1030:
x-microsoft-antispam-prvs: <CY4PR04MB1030B399F7B4551B0311AC95E7950@CY4PR04MB1030.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eNZm2/ibr10US0jEFGouX0s6TiMnuq9ab2JukBXQj+EC1U7by7ELTwtiTy9jjG4Fi4z6BuY4nfw1tLBWDpI0CoYLcY5I+U/XXiSygwYuqYU1+WXm79W+WpVfMGRf80xM2350YpzvG8mVGRCr5qy2PNpl08PbHydmMbxiSTTqZKvN5BG1OFKIEPY+U+jSPg1wa9uH5YsVP3+XIBGlHKcLrzRMMI0tX4MHq/aKiIqXFcM3w/B7KWmF85Y6crgTC7+cgZBwCMU2ePgNKYvOjbGsDlTYu0xBraO9hQiafPpcNz8jnEQA29H52nHsMXX9c9pl3f2U6OiwE7bQnJeKWao6waN33JS1YNAdhOKgHwXGuCFYHjPa3GB3SYyvnPNDhk2b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(7696005)(5660300002)(478600001)(52536014)(91956017)(66946007)(316002)(66556008)(66446008)(64756008)(6506007)(53546011)(76116006)(66476007)(8936002)(33656002)(110136005)(9686003)(55016002)(71200400001)(83380400001)(2906002)(26005)(86362001)(186003)(4326008)(8676002)(309714004);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: eYfHLpXnqh2TyDD+94uq+DY0gdlujSR0d4SLrCxyjZ+e9Hr3wJA24nwCvv9VQpgLzXD8tijB0N6F3uM0fw0472btihvyewCFFK/zJzD/T1xt8uSLfvG8eC//vlRwgsh3Sp93knGkilgKprbpEWqXcuv1BBFd/vWsKrnU9utFr4498FDlmfwbQyifckoYQf1ykmniDEJdgyOygS4zbQXqJ2JeZRa6C/y5LrUDUDs7o0MJU7hGjuFcBL96++i9gNq59mW4cBkGG/L5Ksng8DtyExh9CBsQPX4HkgSRNGfKb+kJexn7ylAe7UK1d+MPdcN4gsrr5dqG0B5eboJXLMr3PDIENSrRChok6luzpxl5h2gyAtbBNLJ4r6+DRQ2O3+cV+c0dY1yG0ZjAj5fnKtZ2T4DPGMFLa73BSRhknB50vR5k8dzcasAk/XWM6tDxru2GFtn1vf1D6kz2dXwGUtruz3ajqnqc0mq4+inCDlL8I3AIwG/FUCwWCIy2Wdfm+cAr
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5941ca-0d5a-47d7-a1d9-08d817fd37c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 05:12:40.0837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cflfz8W/XPqZYvIqHJ8LMKE4gGhMN8RiCFvXK2+bD0dX8FxC0xbBEy8fvZpO50WUhj5rJwZoBguhZDdPTbUjBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1030
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O5Cpdv019047
X-loop: dm-devel@redhat.com
Cc: "kernel-team@cloudflare.com" <kernel-team@cloudflare.com>
Subject: Re: [dm-devel] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE flag to
 dm-crypt target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/22 17:47, Ignat Korchagin wrote:
> Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
> especially visible on busy systems with many processes/threads. Moreover, most
> Crypto API implementaions are async, that is they offload crypto operations on
> their own, so this dm-crypt offloading is excessive.
> 
> This adds a new flag, which directs dm-crypt not to offload crypto operations
> and process everything inline. For cases, where crypto operations cannot happen
> inline (hard interrupt context, for example the read path of the NVME driver),
> we offload the work to a tasklet rather than a workqueue.
> 
> Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
> ---
>  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 000ddfab5ba0..5a9bac4fdffb 100644
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
> @@ -127,7 +128,7 @@ struct iv_elephant_private {
>   * and encrypts / decrypts at the same time.
>   */
>  enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
> -	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
> +	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD, DM_CRYPT_FORCE_INLINE = (sizeof(unsigned long) * 8 - 1) };

I do not see why a special value needs to be defined for DM_CRYPT_FORCE_INLINE.
It is clear from the number of members in the enum that we have far less than 32
flags. Also, it may be good to add DM_CRYPT_FORCE_INLINE as a new line to avoid
the long-ish line.

>  
>  enum cipher_flags {
>  	CRYPT_MODE_INTEGRITY_AEAD,	/* Use authenticated mode for cihper */
> @@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>  
>  	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
>  
> -	/*
> -	 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> -	 * requests if driver request queue is full.
> -	 */
> -	skcipher_request_set_callback(ctx->r.req,
> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
> -	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
> +		/* make sure we zero important fields of the request */
> +		skcipher_request_set_callback(ctx->r.req,
> +	        0, NULL, NULL);

May be add a return here to avoid the need for else ?

> +	else
> +		/*
> +		 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> +		 * requests if driver request queue is full.
> +		 */
> +		skcipher_request_set_callback(ctx->r.req,
> +	        CRYPTO_TFM_REQ_MAY_BACKLOG,
> +	        kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>  }
>  
>  static void crypt_alloc_req_aead(struct crypt_config *cc,
> @@ -1566,7 +1572,8 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>  			atomic_dec(&ctx->cc_pending);
>  			ctx->cc_sector += sector_step;
>  			tag_offset++;
> -			cond_resched();
> +			if (!test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
> +				cond_resched();
>  			continue;
>  		/*
>  		 * There was a data integrity error.
> @@ -1892,6 +1899,11 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
>  
>  	clone->bi_iter.bi_sector = cc->start + io->sector;
>  
> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags)) {
> +		generic_make_request(clone);
> +		return;
> +	}
> +
>  	if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {

A little inline helper such as kcryptd_crypt_write_io_inline(io, async) would
simplify things here: the conditions leading to an inline write will be gathered
together and can be explained. And for SMR, since we also need an IO type based
selection, we can extent the helper without needing another change here.

>  		generic_make_request(clone);
>  		return;
> @@ -2031,12 +2043,26 @@ static void kcryptd_crypt(struct work_struct *work)
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
> -	INIT_WORK(&io->work, kcryptd_crypt);
> -	queue_work(cc->crypt_queue, &io->work);
> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags)) {
> +		if (in_irq()) {
> +			/* Crypto API will fail hard in hard IRQ context */
> +			tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
> +			tasklet_schedule(&io->tasklet);
> +		} else
> +			kcryptd_crypt(&io->work);

Same as above: return here to avoid the else ?

> +	} else {
> +		INIT_WORK(&io->work, kcryptd_crypt);
> +		queue_work(cc->crypt_queue, &io->work);
> +	}
>  }
>  
>  static void crypt_free_tfms_aead(struct crypt_config *cc)
> @@ -2838,7 +2864,7 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>  	struct crypt_config *cc = ti->private;
>  	struct dm_arg_set as;
>  	static const struct dm_arg _args[] = {
> -		{0, 6, "Invalid number of feature args"},
> +		{0, 7, "Invalid number of feature args"},
>  	};
>  	unsigned int opt_params, val;
>  	const char *opt_string, *sval;
> @@ -2868,6 +2894,8 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>  
>  		else if (!strcasecmp(opt_string, "submit_from_crypt_cpus"))
>  			set_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
> +		else if (!strcasecmp(opt_string, "force_inline"))
> +			set_bit(DM_CRYPT_FORCE_INLINE, &cc->flags);
>  		else if (sscanf(opt_string, "integrity:%u:", &val) == 1) {
>  			if (val == 0 || val > MAX_TAG_SIZE) {
>  				ti->error = "Invalid integrity arguments";
> @@ -3196,6 +3224,7 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>  		num_feature_args += !!ti->num_discard_bios;
>  		num_feature_args += test_bit(DM_CRYPT_SAME_CPU, &cc->flags);
>  		num_feature_args += test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
> +		num_feature_args += test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags);
>  		num_feature_args += cc->sector_size != (1 << SECTOR_SHIFT);
>  		num_feature_args += test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags);
>  		if (cc->on_disk_tag_size)
> @@ -3208,6 +3237,8 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>  				DMEMIT(" same_cpu_crypt");
>  			if (test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags))
>  				DMEMIT(" submit_from_crypt_cpus");
> +			if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
> +				DMEMIT(" force_inline");
>  			if (cc->on_disk_tag_size)
>  				DMEMIT(" integrity:%u:%s", cc->on_disk_tag_size, cc->cipher_auth);
>  			if (cc->sector_size != (1 << SECTOR_SHIFT))
> 

Apart from the above few comments, this all looks OK to me (and tested).
One question though: do you have patches for cryptsetup user land tools to allow
controlling the specification of the inline flag on device open ?

It turns out that the most difficult part of the SMR support is patching
cryptsetup. Not much work needed for plain use, but formats such as Luks do not
write super block and metadata sequentially, which causes problems with drives
that do not have conventional zones at LBA 0...
But this is my problem to solve :)

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1D96D209987
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 07:36:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593063400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pumLAUaHZ/ag55YCbjVg7Bna6EjVn7j0KHzu0VjZWZk=;
	b=QigEV0XC3fMXnEZ0yio8M2PRgzAjNDWcPyQ/jUQruD+KkaPpEnrkFwM/SEaA3R6VQtfAQa
	aAGnrd/em1zjSORFUXHWRMXg6/wZfehWbITyF6l4XRM3Ws6UMY58V9cos/8YIysa5q2aAy
	GUkLHVhe9hGC6ZobeZcxDd7yEmKB0kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-QGHVp7wdPXqGiJXtsix4Ig-1; Thu, 25 Jun 2020 01:36:38 -0400
X-MC-Unique: QGHVp7wdPXqGiJXtsix4Ig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6940D87950D;
	Thu, 25 Jun 2020 05:36:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6648100239F;
	Thu, 25 Jun 2020 05:36:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7891C1809547;
	Thu, 25 Jun 2020 05:36:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05P5Zp3M018844 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 01:35:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E5582023282; Thu, 25 Jun 2020 05:35:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B7B20234BA
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 05:35:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F571859162
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 05:35:48 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-Gy4_oGeYOZuDpOkVKvmPVg-1; Thu, 25 Jun 2020 01:35:45 -0400
X-MC-Unique: Gy4_oGeYOZuDpOkVKvmPVg-1
Received: by mail-pj1-f68.google.com with SMTP id b7so3126434pju.0
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 22:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=D1rfkwqd8o/gHSMNBaS4UmENqIHNhp+S+GfsYqqjGCA=;
	b=t5/i2eiPIqGZ8NS0uJWz9p3NxRJ+YReZvhAofQfUu4NUytW4RUvHZwTonCHbsHMCj/
	DrFvKsorSB8Jucby94fST97iZH8gXjege+p9WfXXwZ2bnM8wBgzmH7Exryzv9SmcaKOA
	v0sQaUxAos1TAD1EUYATwa2/rult/L8hBfOlx7Urt3enIQRRec5ZwXriDL8Fq9TVFhjm
	hYPa9fmGKKrGhIBHllkp6dyReyxgP84S/sDPIocz8RNIueCDO6Z2F3QwVbibKeA9dWZY
	gJGdANbChxRnkNgG8wgm9lcLuOrAyl+MdLWb1iMY5Ctv1ZZAxZg4ymSltRRphfDs+Rkr
	RaPQ==
X-Gm-Message-State: AOAM530VcLBoXjrumi/IEw63w1kveW61daMpahMzKuchRiPnjsFUbrlT
	hczU56MrMpUccs0cgzYWqpM/cB+3zqg=
X-Google-Smtp-Source: ABdhPJyVVLGMKtPc4KdNVtADx1R2iFPJ5iWx+la8IV1Y4yLTaIRofVhLc3z77+MD4as0YLRu+hJqHw==
X-Received: by 2002:a17:902:121:: with SMTP id
	30mr31615923plb.44.1593063344291; 
	Wed, 24 Jun 2020 22:35:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	w124sm21350507pfc.213.2020.06.24.22.35.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 24 Jun 2020 22:35:43 -0700 (PDT)
Date: Wed, 24 Jun 2020 22:35:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Aiden Leong <aiden.leong@aibsd.com>
Message-ID: <202006242231.E17DAB2@keescook>
References: <20200625041141.8053-1-aiden.leong@aibsd.com>
MIME-Version: 1.0
In-Reply-To: <20200625041141.8053-1-aiden.leong@aibsd.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Tony Luck <tony.luck@intel.com>, Mike Snitzer <snitzer@redhat.com>,
	Ferdinand Blomqvist <ferdinand.blomqvist@gmail.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Anton Vorontsov <anton@enomsg.org>,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Colin Cross <ccross@android.com>,
	Thomas Gleixner <tglx@linutronix.de>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [RFC] Reed-Solomon Code: Update no_eras to the
 actual number of errors
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
Content-Disposition: inline

On Wed, Jun 24, 2020 at 09:10:53PM -0700, Aiden Leong wrote:
> Corr and eras_pos are updated to actual correction pattern and erasure
> positions, but no_eras is not.
> 
> When this library is used to recover lost bytes, we normally memset the
> lost trunk of bytes to zero as a placeholder. Unfortunately, if the lost
> byte is zero, b[i] is zero too. Without correct no_eras, users won't be
> able to determine the valid length of corr and eras_pos.
> 
> Signed-off-by: Aiden Leong <aiden.leong@aibsd.com>
> ---
>  drivers/md/dm-verity-fec.c      |  2 +-
>  fs/pstore/ram_core.c            |  2 +-
>  include/linux/rslib.h           |  4 ++--
>  lib/reed_solomon/decode_rs.c    | 20 ++++++++++++++------
>  lib/reed_solomon/reed_solomon.c |  4 ++--
>  lib/reed_solomon/test_rslib.c   | 18 ++++++++++++------
>  6 files changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
> index fb41b4f23c48..ae8366a50244 100644
> --- a/drivers/md/dm-verity-fec.c
> +++ b/drivers/md/dm-verity-fec.c
> @@ -50,7 +50,7 @@ static int fec_decode_rs8(struct dm_verity *v, struct dm_verity_fec_io *fio,
>  	for (i = 0; i < v->fec->roots; i++)
>  		par[i] = fec[i];
>  
> -	return decode_rs8(fio->rs, data, par, v->fec->rsn, NULL, neras,
> +	return decode_rs8(fio->rs, data, par, v->fec->rsn, NULL, &neras,
>  			  fio->erasures, 0, NULL);
>  }
>  
> diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
> index aa8e0b65ff1a..fcc661a60640 100644
> --- a/fs/pstore/ram_core.c
> +++ b/fs/pstore/ram_core.c
> @@ -115,7 +115,7 @@ static int persistent_ram_decode_rs8(struct persistent_ram_zone *prz,
>  
>  	for (i = 0; i < prz->ecc_info.ecc_size; i++)
>  		prz->ecc_info.par[i] = ecc[i];
> -	return decode_rs8(prz->rs_decoder, data, prz->ecc_info.par, len,
> +	return decode_rs8(prz->rs_decoder, data, prz->ecc_info.par, &len,
>  				NULL, 0, NULL, 0, NULL);

This looks like the wrong arg changed -- did you compile test this?

>  }
>  
> diff --git a/include/linux/rslib.h b/include/linux/rslib.h
> index 238bb85243d3..80662abc9af7 100644
> --- a/include/linux/rslib.h
> +++ b/include/linux/rslib.h
> @@ -64,7 +64,7 @@ int encode_rs8(struct rs_control *rs, uint8_t *data, int len, uint16_t *par,
>  #endif
>  #ifdef CONFIG_REED_SOLOMON_DEC8
>  int decode_rs8(struct rs_control *rs, uint8_t *data, uint16_t *par, int len,
> -		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
> +		uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
>  	       uint16_t *corr);
>  #endif
>  
> @@ -75,7 +75,7 @@ int encode_rs16(struct rs_control *rs, uint16_t *data, int len, uint16_t *par,
>  #endif
>  #ifdef CONFIG_REED_SOLOMON_DEC16
>  int decode_rs16(struct rs_control *rs, uint16_t *data, uint16_t *par, int len,
> -		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
> +		uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
>  		uint16_t *corr);
>  #endif
>  
> diff --git a/lib/reed_solomon/decode_rs.c b/lib/reed_solomon/decode_rs.c
> index 805de84ae83d..122bc08eb75f 100644
> --- a/lib/reed_solomon/decode_rs.c
> +++ b/lib/reed_solomon/decode_rs.c
> @@ -24,6 +24,7 @@
>  	int count = 0;
>  	int num_corrected;
>  	uint16_t msk = (uint16_t) rs->nn;
> +	int no_eras_orig = no_eras ? *no_eras : 0;

To avoid code churn, I would name this int no_eras, and change the arg
to something like no_eras_ptr:

	int no_eras = no_eras_ptr ? *no_eras_ptr : 0;

>  
>  	/*
>  	 * The decoder buffers are in the rs control struct. They are
> @@ -106,11 +107,11 @@
>  	memset(&lambda[1], 0, nroots * sizeof(lambda[0]));
>  	lambda[0] = 1;
>  
> -	if (no_eras > 0) {
> +	if (no_eras_orig > 0) {
>  		/* Init lambda to be the erasure locator polynomial */
>  		lambda[1] = alpha_to[rs_modnn(rs,
>  					prim * (nn - 1 - (eras_pos[0] + pad)))];
> -		for (i = 1; i < no_eras; i++) {
> +		for (i = 1; i < no_eras_orig; i++) {
>  			u = rs_modnn(rs, prim * (nn - 1 - (eras_pos[i] + pad)));
>  			for (j = i + 1; j > 0; j--) {
>  				tmp = index_of[lambda[j - 1]];
> @@ -129,8 +130,8 @@
>  	 * Begin Berlekamp-Massey algorithm to determine error+erasure
>  	 * locator polynomial
>  	 */
> -	r = no_eras;
> -	el = no_eras;
> +	r = no_eras_orig;
> +	el = no_eras_orig;
>  	while (++r <= nroots) {	/* r is the step number */
>  		/* Compute discrepancy at the r-th step in poly-form */
>  		discr_r = 0;
> @@ -158,8 +159,8 @@
>  				} else
>  					t[i + 1] = lambda[i + 1];
>  			}
> -			if (2 * el <= r + no_eras - 1) {
> -				el = r + no_eras - el;
> +			if (2 * el <= r + no_eras_orig - 1) {
> +				el = r + no_eras_orig - el;
>  				/*
>  				 * 2 lines below: B(x) <-- inv(discr_r) *
>  				 * lambda(x)
> @@ -312,14 +313,21 @@
>  				eras_pos[j++] = loc[i] - pad;
>  			}
>  		}
> +		if (no_eras > 0)
> +			*no_eras = j;

Is this meant to be "if (j > 0)" or "if (no_eras != NULL)" ? It's
uncommon to use > 0 for a pointer value.

>  	} else if (data && par) {
>  		/* Apply error to data and parity */
> +		j = 0;
>  		for (i = 0; i < count; i++) {
>  			if (loc[i] < (nn - nroots))
>  				data[loc[i] - pad] ^= b[i];
>  			else
>  				par[loc[i] - pad - len] ^= b[i];
> +			if (b[i])
> +				j++;
>  		}
> +		if (no_eras > 0)
> +			*no_eras = j;

I assume it's a pointer test, so both would be:

		if (no_eras_ptr != NULL)
			*no_eras_ptr = j;

>  	}
>  
>  	return  num_corrected;
> diff --git a/lib/reed_solomon/reed_solomon.c b/lib/reed_solomon/reed_solomon.c
> index bbc01bad3053..b2c811674c98 100644
> --- a/lib/reed_solomon/reed_solomon.c
> +++ b/lib/reed_solomon/reed_solomon.c
> @@ -359,7 +359,7 @@ EXPORT_SYMBOL_GPL(encode_rs8);
>   *  errors. The count includes errors in the parity.
>   */
>  int decode_rs8(struct rs_control *rsc, uint8_t *data, uint16_t *par, int len,
> -	       uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
> +	       uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
>  	       uint16_t *corr)
>  {
>  #include "decode_rs.c"
> @@ -410,7 +410,7 @@ EXPORT_SYMBOL_GPL(encode_rs16);
>   *  errors. The count includes errors in the parity.
>   */
>  int decode_rs16(struct rs_control *rsc, uint16_t *data, uint16_t *par, int len,
> -		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
> +		uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
>  		uint16_t *corr)
>  {
>  #include "decode_rs.c"
> diff --git a/lib/reed_solomon/test_rslib.c b/lib/reed_solomon/test_rslib.c
> index 4eb29f365ece..b30a4aea8796 100644
> --- a/lib/reed_solomon/test_rslib.c
> +++ b/lib/reed_solomon/test_rslib.c
> @@ -258,7 +258,7 @@ static void compute_syndrome(struct rs_control *rsc, uint16_t *data,
>  
>  /* Test up to error correction capacity */
>  static void test_uc(struct rs_control *rs, int len, int errs,
> -		int eras, int trials, struct estat *stat,
> +		int *eras, int trials, struct estat *stat,
>  		struct wspace *ws, int method)
>  {
>  	int dlen = len - rs->codec->nroots;
> @@ -327,8 +327,11 @@ static int ex_rs_helper(struct rs_control *rs, struct wspace *ws,
>  		pr_info("  %s\n", desc[method]);
>  
>  	for (errs = 0; errs <= nroots / 2; errs++)
> -		for (eras = 0; eras <= nroots - 2 * errs; eras++)
> -			test_uc(rs, len, errs, eras, trials, &stat, ws, method);
> +		for (eras = 0; eras <= nroots - 2 * errs; eras++) {
> +			int no_eras = ers;
> +
> +			test_uc(rs, len, errs, &no_eras, trials, &stat, ws, method);
> +		}
>  
>  	if (v >= V_CSUMMARY) {
>  		pr_info("    Decodes wrong:        %d / %d\n",
> @@ -364,7 +367,7 @@ static int exercise_rs(struct rs_control *rs, struct wspace *ws,
>  
>  /* Tests for correct behaviour beyond error correction capacity */
>  static void test_bc(struct rs_control *rs, int len, int errs,
> -		int eras, int trials, struct bcstat *stat,
> +		int *eras, int trials, struct bcstat *stat,
>  		struct wspace *ws)
>  {
>  	int nroots = rs->codec->nroots;
> @@ -420,8 +423,11 @@ static int exercise_rs_bc(struct rs_control *rs, struct wspace *ws,
>  			eras = 0;
>  
>  		cutoff = nroots <= len - errs ? nroots : len - errs;
> -		for (; eras <= cutoff; eras++)
> -			test_bc(rs, len, errs, eras, trials, &stat, ws);
> +		for (; eras <= cutoff; eras++) {
> +			int no_eras = eras;
> +
> +			test_bc(rs, len, errs, &no_eras, trials, &stat, ws);
> +		}
>  	}
>  
>  	if (v >= V_CSUMMARY) {
> -- 
> 2.25.1
> 

Otherwise, yeah, cool. Looks good.

-- 
Kees Cook

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


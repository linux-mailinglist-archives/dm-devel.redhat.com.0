Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E083420AE4B
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=px8g7Z6lpXfJa7pc4fBzp/FxdmzbHOaF2NbIx8TEJwk=;
	b=RMkFp5XydkDgH5aMOnCiFp4/cfuIFGsq9uR/CcMClhkd1ukc7c45Cxf34gcwCeXTny5LJI
	fc5A77jkfo7VjZ/xZHsmyVoM2RkQT3g6ksbudMMSn8BbVuQsBpsGq6LHBNwQtqWWjO1Kw/
	kvrdrs2Tfdo1flCZHku8G9ASV1b/dX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-EPJFieZNPDa5RSEnIq_Lcg-1; Fri, 26 Jun 2020 04:14:30 -0400
X-MC-Unique: EPJFieZNPDa5RSEnIq_Lcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EDEE107ACF8;
	Fri, 26 Jun 2020 08:14:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED87719749;
	Fri, 26 Jun 2020 08:14:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD3CE875B4;
	Fri, 26 Jun 2020 08:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PD6Wi6030801 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 09:06:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3498620230A9; Thu, 25 Jun 2020 13:06:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D990202A942
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:06:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0171049840
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:06:30 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-dHzyqWj3MTKoTFKMJxwrfA-1; Thu, 25 Jun 2020 09:06:25 -0400
X-MC-Unique: dHzyqWj3MTKoTFKMJxwrfA-1
Received: by mail-lj1-f194.google.com with SMTP id y11so6399822ljm.9;
	Thu, 25 Jun 2020 06:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=vc/S2EWgCHsgT5Nzz6iGODeZAQiwBDaupCDYyn5XQ4w=;
	b=bhYI6XmlTu43sAflxlNiu86n1bPr/Kqml6cxoaLdtXUBbPNAgBpFvN+QrJ7vOFb482
	uktd0tbBTENjMt1+tqBxHyYq5BRmTjDkOe/DGhPkTIB0he04CwTkBtal9ON5i+TFxo/K
	oC81qnybIJl4a9pHabmd7OpAaTTDPzy/m8xYZXP06fS+yxDEmDcS9lvJRGcJghYcGSvL
	OUpB8B1iprH0aXW9HXkMq6jRKjBieTPUiCBjMUbUPHnqD7BQZTfhyLQcxcCpRwug0xnf
	tB4SzOTZqeYUKxWsoLbyqPTRBgwYgO8QWOu8291J2NnLLhdYBGA+H0VznY+fknaqmQZr
	3n+Q==
X-Gm-Message-State: AOAM532gkeRVBJvXvim3/vt3nwn3te5SA/Noa9PAM6cdDKDtnvT6UrYu
	wOBEyI4hcN1jeZ8ltzdfWJ4=
X-Google-Smtp-Source: ABdhPJwpHGDHGppDaVjA7fx7KGXSP76D2s/LY0qTH3mWDhsQ1JqjI2sWV2fTQDILYiZ7d239mOAU8g==
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr7755491lji.25.1593090383640; 
	Thu, 25 Jun 2020 06:06:23 -0700 (PDT)
Received: from mail-personal.localdomain ([185.204.1.215])
	by smtp.gmail.com with ESMTPSA id
	x10sm4804484ljx.67.2020.06.25.06.06.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 25 Jun 2020 06:06:22 -0700 (PDT)
Received: by mail-personal.localdomain (Postfix, from userid 1000)
	id 7A8A9611B4; Thu, 25 Jun 2020 16:06:24 +0300 (EEST)
Date: Thu, 25 Jun 2020 16:06:24 +0300
From: Ferdinand Blomqvist <ferdinand.blomqvist@gmail.com>
To: Aiden Leong <aiden.leong@aibsd.com>
Message-ID: <20200625130624.GC1036@mail-personal>
References: <20200625073621.4919-1-aiden.leong@aibsd.com>
MIME-Version: 1.0
In-Reply-To: <20200625073621.4919-1-aiden.leong@aibsd.com>
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Mike Snitzer <snitzer@redhat.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [RFC v2] Reed-Solomon Code: Update no_eras to the
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi!

On 2020-06-25 00:36:01, Aiden Leong wrote:
>Corr and eras_pos are updated to actual correction pattern and erasure
>positions, but no_eras is not.
>
>When this library is used to recover lost bytes, we normally memset the
>lost trunk of bytes to zero as a placeholder. Unfortunately, if the lost
>byte is zero, b[i] is zero too. Without correct no_eras, users won't be
>able to determine the valid length of corr and eras_pos.
>
>Signed-off-by: Aiden Leong <aiden.leong@aibsd.com>

I'm not sure I understand what you try to do. decode_rs* already returns
the number of errors correted (or something negative upon failure). So
your last statment is false. The lengt of corr and eras_pos is returned
by the function. So this change is unnecessary. More comments inline.

>
>diff --git a/lib/reed_solomon/decode_rs.c b/lib/reed_solomon/decode_rs.c
>index 805de84ae83d..44136ea33d16 100644
>--- a/lib/reed_solomon/decode_rs.c
>+++ b/lib/reed_solomon/decode_rs.c
>@@ -24,6 +24,7 @@
> 	int count = 0;
> 	int num_corrected;
> 	uint16_t msk = (uint16_t) rs->nn;
>+	int no_eras_local = no_eras ? *no_eras : 0;
>
> 	/*
> 	 * The decoder buffers are in the rs control struct. They are
>@@ -106,11 +107,11 @@
> 	memset(&lambda[1], 0, nroots * sizeof(lambda[0]));
> 	lambda[0] = 1;
>
>-	if (no_eras > 0) {
>+	if (no_eras_local > 0) {
> 		/* Init lambda to be the erasure locator polynomial */
> 		lambda[1] = alpha_to[rs_modnn(rs,
> 					prim * (nn - 1 - (eras_pos[0] + pad)))];
>-		for (i = 1; i < no_eras; i++) {
>+		for (i = 1; i < no_eras_local; i++) {
> 			u = rs_modnn(rs, prim * (nn - 1 - (eras_pos[i] + pad)));
> 			for (j = i + 1; j > 0; j--) {
> 				tmp = index_of[lambda[j - 1]];
>@@ -129,8 +130,8 @@
> 	 * Begin Berlekamp-Massey algorithm to determine error+erasure
> 	 * locator polynomial
> 	 */
>-	r = no_eras;
>-	el = no_eras;
>+	r = no_eras_local;
>+	el = no_eras_local;
> 	while (++r <= nroots) {	/* r is the step number */
> 		/* Compute discrepancy at the r-th step in poly-form */
> 		discr_r = 0;
>@@ -158,8 +159,8 @@
> 				} else
> 					t[i + 1] = lambda[i + 1];
> 			}
>-			if (2 * el <= r + no_eras - 1) {
>-				el = r + no_eras - el;
>+			if (2 * el <= r + no_eras_local - 1) {
>+				el = r + no_eras_local - el;
> 				/*
> 				 * 2 lines below: B(x) <-- inv(discr_r) *
> 				 * lambda(x)
>@@ -312,14 +313,21 @@
> 				eras_pos[j++] = loc[i] - pad;
> 			}
> 		}
>+		if (no_eras)
>+			*no_eras = j;
At this point j will be equal to num_corrected. So why return this
information in no_eras, when it is already returned by the function?

> 	} else if (data && par) {
> 		/* Apply error to data and parity */
>+		j = 0;
> 		for (i = 0; i < count; i++) {
> 			if (loc[i] < (nn - nroots))
> 				data[loc[i] - pad] ^= b[i];
> 			else
> 				par[loc[i] - pad - len] ^= b[i];
>+			if (b[i])
>+				j++;
> 		}
>+		if (no_eras)
>+			*no_eras = j;

Same as above.

>2.25.1
>

Best,
Ferdinand

-- 
Ferdinand Blomqvist
ferdinand.blomqvist[at]gmail.com
GPG key: 9EFB 7A2C 0432 4EC5 32BA FA61 CFE9 4164 93E8 B9E4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


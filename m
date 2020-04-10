Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F3AF21A47EE
	for <lists+dm-devel@lfdr.de>; Fri, 10 Apr 2020 17:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586533345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B4z6YnZ8nfhupDQTsOFWIcjiBFgm6vqJ0vALz8ABC7Q=;
	b=YxqK2BHj/VnPsPtMleUU4ALxlj++3zhIH/tv5F4cytzTuyv5VxyKR2czRq66hUQPqbg5fs
	40nBGg7+CCkzGk+neGmDi5yv2qPfRybFJ5hysRomzn8gLeXbR6mnSzwHq6yYhypyet0FN0
	hbEV4A5W5TVlDaOdKuCI1NMADIj+POw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-3gPv92tWOliB03uiTAKHQQ-1; Fri, 10 Apr 2020 11:42:21 -0400
X-MC-Unique: 3gPv92tWOliB03uiTAKHQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BAA01005510;
	Fri, 10 Apr 2020 15:42:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E2238E;
	Fri, 10 Apr 2020 15:42:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37C2E4E447;
	Fri, 10 Apr 2020 15:41:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03AFfhWH031145 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Apr 2020 11:41:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 96E3C127537; Fri, 10 Apr 2020 15:41:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9304E127535
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 15:41:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A35D8007C9
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 15:41:41 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-VEL7ccfbNmawbOMIrlsrrw-1; Fri, 10 Apr 2020 11:41:38 -0400
X-MC-Unique: VEL7ccfbNmawbOMIrlsrrw-1
Received: by mail-ua1-f67.google.com with SMTP id x18so21976uap.8
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 08:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jWbMH4oNnz05JQ7wFt+TyzZu2aIe+EerfGV5Pu7qQt4=;
	b=g0Xv6su9qGKZ+GrG10WVTok3f4FC+EonuSb2t7v2RAJo+z5TwrzVKkX5xL9fqnm3+a
	th1/y7Er4p/yRUuN6mKsF7HEnHa89zFVSUs8S/m/vTlRXBg7NBcMATHY8gZohuvaX0Jl
	5SzIgI1ac+51AV5vXgujtx0Aegx71DMl0rHoCDCrRoYoRV75vFVADEoEUz5y/lBN+0wS
	AO5sU4++VTbzzLGMvM3Axa+NwFw07FibtXeKViTkadEry+npeYbtMepJuCFkv51zM+b8
	9lK8kFvqrz2Sm2QnJV7E2tRTxQQN/mghARDX7djjmBeaYT12Hy8m2q2EXgrMClG7Nf68
	Pbag==
X-Gm-Message-State: AGi0PuZzJcRa3HjHgvNiBITabm05X1KSAw0CHMo0+Kr/BKi9Oisk6fdu
	dx1gx/oK13IhQO2PljnE5NtYK1nvhJGFt/S8L9Z+cQ==
X-Google-Smtp-Source: APiQypJl1wYtl63R/0HT2frMnfksy4DoViUEu5Hdmh5cKpaVRJxii0VqhQF9e1NJUi0I12Hez5s2ntXzWpyMWJJZGU4=
X-Received: by 2002:ab0:3389:: with SMTP id y9mr3407878uap.98.1586533297855;
	Fri, 10 Apr 2020 08:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269@epcas1p2.samsung.com>
	<b8de2c4b-d8cf-2bdb-f4cf-5b10faf48955@samsung.com>
In-Reply-To: <b8de2c4b-d8cf-2bdb-f4cf-5b10faf48955@samsung.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 10 Apr 2020 08:41:26 -0700
Message-ID: <CABCJKueSJ4sXHL5xnB5LQVW_6od2+_TEp0y_vv1gdi=yBB1Zfg@mail.gmail.com>
To: Sunwook Eom <speed.eom@samsung.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03AFfhWH031145
X-loop: dm-devel@redhat.com
Cc: =?UTF-8?B?6rCV66y47LKg?= <mcneo.kang@samsung.com>,
	device-mapper development <dm-devel@redhat.com>,
	sunwook5492@gmail.com, Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm verity fec: fix hash block number in
	verity_fec_decode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 9, 2020 at 8:54 PM Sunwook Eom <speed.eom@samsung.com> wrote:
>
> The error correction data is computed as if data and hash blocks
> were concatenated. But hash block number is start from v->hash_start.
> So, we have to calculate hash block number based on that.
>
> Fixes: a739ff3f543af ("dm verity: add support for forward error correction")
> Signed-off-by: Sunwook Eom <speed.eom@samsung.com>
> ---
>   drivers/md/dm-verity-fec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
> index 49147e634046..fb41b4f23c48 100644
> --- a/drivers/md/dm-verity-fec.c
> +++ b/drivers/md/dm-verity-fec.c
> @@ -435,7 +435,7 @@ int verity_fec_decode(struct dm_verity *v, struct
> dm_verity_io *io,
>       fio->level++;
>
>       if (type == DM_VERITY_BLOCK_TYPE_METADATA)
> -        block += v->data_blocks;
> +        block = block - v->hash_start + v->data_blocks;
>
>       /*
>        * For RS(M, N), the continuous FEC data is divided into blocks of N

Thank you for the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE458443E
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jul 2022 18:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659026126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XVWqNDPK+sE8nlxyQ92dp68XsXtpEs6ZohKbeEtFoDY=;
	b=Qcs+LgDWSg04KRzjlAyZB6k8p7YsRMx8tScB5ZC2UVrxT4izNP/4LVku0XlRK4AzRDrVQK
	wpVOWuagm60eKOlnmhSos7FSalT9bz4afw1dKckoNmvGJKm7apJUsUlJTBdYOphqelH4/m
	EXoqXzHYV3Mh4mk82TsR0x5mg5b1s9E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-Loj8m98RNDmYhYSWxzgSFA-1; Thu, 28 Jul 2022 12:35:24 -0400
X-MC-Unique: Loj8m98RNDmYhYSWxzgSFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AD723C3000F;
	Thu, 28 Jul 2022 16:35:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01959404D883;
	Thu, 28 Jul 2022 16:35:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6D0431945DB2;
	Thu, 28 Jul 2022 16:35:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F79B1945DA7
 for <dm-devel@listman.corp.redhat.com>; Thu, 28 Jul 2022 16:35:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3F174909FF; Thu, 28 Jul 2022 16:35:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AE8118EB5
 for <dm-devel@redhat.com>; Thu, 28 Jul 2022 16:35:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16391185A7B2
 for <dm-devel@redhat.com>; Thu, 28 Jul 2022 16:35:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-mtqx5mcIMUOBu_ZktfyAvA-1; Thu, 28 Jul 2022 12:35:13 -0400
X-MC-Unique: mtqx5mcIMUOBu_ZktfyAvA-1
Received: by mail-ej1-f54.google.com with SMTP id tk8so4065548ejc.7
 for <dm-devel@redhat.com>; Thu, 28 Jul 2022 09:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WuvoJ90b2lCyCsNl1uoWkwZZ34W9Zu4j6EvkcDdXVwQ=;
 b=jYmtjFrYbr8aAIGt6PogR9iQz/BNI4PkZhtFiuxh60vtFcc27dCoXzwaFfE+nLAxxG
 548+Ad/9E7dIVAr/nybsTNlS3mQfdU5ccTdRz296T6OUtgqF/Oip1qw+KNiSvuqMagse
 +QAdu9eWX+LL9AXFAd8xux3r9H62S1viPGtjNK4Kkje0VyBhr1ezF5Pi5+QWneFpstMB
 qrqbedEx6mhdyfOQ8J51EaopX6J8Nzqq87kNjBw7j94E23RcR4u1IA8/RFmqhjwMVlD+
 tjC+QcVQrjY2LUQQ+TPYlTGHLNlHbJWaVbJIdJuJO2GO7JUdWzuSu2OnTGLRXDS3tUyh
 y7TA==
X-Gm-Message-State: AJIora/koGEBy8WFZm4RXH7+Gk0LHrhTBzX0vv5jmBkoCKAZDxYgiX7j
 HtDmVSeAa9AhLhFZgi0ICar9emydWO2u16u6
X-Google-Smtp-Source: AGRyM1sGUUCMEdAIvli5I7KpBW4mKLjdjVPse3s/10rqf7f9DRYSd7H9my4Uo4IXl2y3Bv5/Bk04FA==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr22134568ejc.66.1659026111787; 
 Thu, 28 Jul 2022 09:35:11 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 24-20020a170906301800b007262a1c8d20sm603488ejz.19.2022.07.28.09.35.10
 for <dm-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 09:35:10 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id h8so2934472wrw.1
 for <dm-devel@redhat.com>; Thu, 28 Jul 2022 09:35:10 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr18613494wrn.138.1659026109819; Thu, 28
 Jul 2022 09:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220728085412.1.I242d21b378410eb6f9897a3160efb56e5608c59d@changeid>
In-Reply-To: <20220728085412.1.I242d21b378410eb6f9897a3160efb56e5608c59d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 09:34:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UR+DhWuc555q8dde7MJwgkvG-s1rWYXqQ-afdo3q80pw@mail.gmail.com>
Message-ID: <CAD=FV=UR+DhWuc555q8dde7MJwgkvG-s1rWYXqQ-afdo3q80pw@mail.gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH] dm: verity-loadpin: Drop use of
 dm_table_get_num_targets()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-security-module <linux-security-module@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Mike Snitzer <snitzer@kernel.org>, James Morris <jmorris@namei.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-raid@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, Jul 28, 2022 at 8:54 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Commit 2aec377a2925 ("dm table: remove dm_table_get_num_targets()
> wrapper") in linux-dm/for-next removed the function
> dm_table_get_num_targets() which is used by verity-loadpin. Access
> table->num_targets directly instead of using the defunct wrapper.
>
> Fixes: b6c1c5745ccc ("dm: Add verity helpers for LoadPin")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  drivers/md/dm-verity-loadpin.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


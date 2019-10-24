Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 68535E457B
	for <lists+dm-devel@lfdr.de>; Fri, 25 Oct 2019 10:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571991669;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YbwzZ28S986rTTv5EfQUJEaabQQMsMOX/H4qp0AwOrk=;
	b=KfX+Xw7bL0L9+2eqevjwdxzHhMgDCZhYctG+79/ZyREzUdyWNRrPk1gmJAyv0W/XrT14Ad
	EGiW9yqQG0E8eecgYaM30KC9f2jE7DkSD+TK9/o5z17NRSuwzK5ZG0Yq2UFjrWn94LExez
	1vEXPxcZJqQrFgN796bcIqEo2FaFfdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-fmD4ooz7OPG3Ybf6YH-1Eg-1; Fri, 25 Oct 2019 04:21:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B687E1800E09;
	Fri, 25 Oct 2019 08:21:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2525D9CA;
	Fri, 25 Oct 2019 08:20:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A67C3FB43;
	Fri, 25 Oct 2019 08:20:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OLkQrI021243 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 17:46:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BEDE5C1B5; Thu, 24 Oct 2019 21:46:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 861AC5C21A
	for <dm-devel@redhat.com>; Thu, 24 Oct 2019 21:46:23 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F3BE3D955
	for <dm-devel@redhat.com>; Thu, 24 Oct 2019 21:46:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v19so131020pfm.3
	for <dm-devel@redhat.com>; Thu, 24 Oct 2019 14:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ylg2MBhMeUrtylr2iEwM0Lf6LZuEbMgXeAE0LFqAQ+Q=;
	b=MqcL54mJ6MDbeAHk8pR6i1w55NniiVmRlF8i3y9valGsFuayTjtWktOWP+X/AVaSjS
	j6cyBAEXn4w+pYdF6nFQUq5ADM8V4lMJFlwFgUzY5mPbT/w8AmwEDfXi4UG9CJK3G6yk
	Gj8+YYHyDgxZOasPeTFGgHZcKPQdToARSvnB8CExS/f8Nrz5oEnNhTO2WuesHR2Vybax
	GLMv6j9C2/FRICioe0fZKyzEzPIsRHwtyknUWunJPweyg9RWDeg6FVOH304hGkHBGGA9
	03X2bbCRxl5ySiZCsmeSc7y7NxKGr2KwS3XPSkiTkeXAgn9pAQrxxEgwIW2pEwLDVl4H
	h+vQ==
X-Gm-Message-State: APjAAAWF4hBZ35wLn1LVORAi6b6wA6zbgfsPh4KhioHx1Iv9XKELAA4N
	6r5MkoOISdZKDOtXXtne0H2zIGFv48Anj+OIKghVcg==
X-Google-Smtp-Source: APXvYqwm1PMIf+mWSjmzR6zcrl6IRhfA7LoN6krcH8c8m4x2dfkIHyl7OijiD3mbk1iUnqEWOrmv1xaVDzusce8/oJQ=
X-Received: by 2002:a17:90a:17e1:: with SMTP id
	q88mr9863054pja.134.1571953581844; 
	Thu, 24 Oct 2019 14:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191024202803.47613-1-natechancellor@gmail.com>
In-Reply-To: <20191024202803.47613-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Oct 2019 14:46:10 -0700
Message-ID: <CAKwvOdmw+fSNfksLtiAKF8upAuQB+rOzWP010cC-ivF5z=XuYA@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 24 Oct 2019 21:46:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 24 Oct 2019 21:46:23 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'ndesaulniers@google.com'
	RCPT:''
X-RedHat-Spam-Score: -15.599  (DKIMWL_WL_MED, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE, SPF_PASS,
	USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL) 209.85.210.195 mail-pf1-f195.google.com
	209.85.210.195 mail-pf1-f195.google.com
	<ndesaulniers@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 04:20:32 -0400
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] dm raid: Remove unnecessary negation of a
	shift in raid10_format_to_md_layout
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
X-MC-Unique: fmD4ooz7OPG3Ybf6YH-1Eg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 1:28 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with Clang + -Wtautological-constant-compare:
>
>  drivers/md/dm-raid.c:619:8: warning: converting the result of '<<' to a
>  boolean always evaluates to true [-Wtautological-constant-compare]
>                  r =3D !RAID10_OFFSET;
>                       ^
>  drivers/md/dm-raid.c:517:28: note: expanded from macro 'RAID10_OFFSET'
>  #define RAID10_OFFSET                   (1 << 16) /* stripes with data
>  copies area adjacent on devices */
>                                            ^
>  1 warning generated.
>
> Negating a non-zero number will always make it zero, which is the
> default value of r in this function so this statement is unnecessary;

Yep, thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
(algorithm should be an enum, and there's some code duplication
between ALGORITHM_RAID10_OFFSET and ALGORITHM_RAID10_FAR cases, but
this patch is good enough).

> remove it so that clang no longer warns.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/753
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/md/dm-raid.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index b0aa595e4375..13fabc6779e5 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -616,7 +616,6 @@ static int raid10_format_to_md_layout(struct raid_set=
 *rs,
>
>         } else if (algorithm =3D=3D ALGORITHM_RAID10_FAR) {
>                 f =3D copies;
> -               r =3D !RAID10_OFFSET;
>                 if (!test_bit(__CTR_FLAG_RAID10_USE_NEAR_SETS, &rs->ctr_f=
lags))
>                         r |=3D RAID10_USE_FAR_SETS;
>


--=20
Thanks,
~Nick Desaulniers

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D02D316D6B
	for <lists+dm-devel@lfdr.de>; Wed, 10 Feb 2021 18:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612979847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z/TTtJs2kyUqijUwBkzqGC1VLYSCDiXey92mnz3lLkE=;
	b=BKA/yv7oqAT/JtNi4Zt4amLF7vNmAumBAxmClmP7m6znSFwHhjaNz3gOD2mm2+mPaWLXK3
	jgjqXkn88Ig+uqxTmL1fGZeJaRtqsY3UhZi0RjBP7mEUaZDK4wlirSr3A3aeIdeF0er+2E
	MB1GDbwYxIpvyfWL/r6B+jb8Dbr63XA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-AQLec6lSNqqWo-jm7PxWlw-1; Wed, 10 Feb 2021 12:57:24 -0500
X-MC-Unique: AQLec6lSNqqWo-jm7PxWlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A55F107ACE3;
	Wed, 10 Feb 2021 17:57:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A975819CB0;
	Wed, 10 Feb 2021 17:57:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C95858073;
	Wed, 10 Feb 2021 17:57:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AHuje2024566 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 12:56:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CA862026D46; Wed, 10 Feb 2021 17:56:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 280232026D13
	for <dm-devel@redhat.com>; Wed, 10 Feb 2021 17:56:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA131185A795
	for <dm-devel@redhat.com>; Wed, 10 Feb 2021 17:56:38 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-546-FlQG1lugOsuNCIprg5k4sg-1; Wed, 10 Feb 2021 12:56:36 -0500
X-MC-Unique: FlQG1lugOsuNCIprg5k4sg-1
Received: by mail-ot1-f70.google.com with SMTP id v108so1410101otb.6
	for <dm-devel@redhat.com>; Wed, 10 Feb 2021 09:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rhbO5qL+OtLSumRQ5YvBmN2aN1sCguq/3pAzHFnpvvc=;
	b=X6JtOTPXOvDibL6J4ePeETconXK44rLg5C//qnuIJtW6B5TcJHQNIpd09K6IRKx7Dw
	J2Oy9mg8DFbh5kClBS6dSOtq4Ia++f7OB3aFWclPcXJxrTZPHP0zgaYEnY4V7PNs70lH
	UYVG8kJUXvqWtfe6aNfo9DEJ0R1ZMR6fTwCeXZH0sCvnRq0F0hyY4cfnE+jzHO2raZOn
	DKYh2a9WknY8JpF9y4W8k33F0s4J5ubLxvz3iiKHqedxYLwzL/ImdtrcIMDC2sU9pxNF
	146yev8xMsRKwofWZ0T5CUccJBPGbR6XjnkCOv1blqJFNcyobN2hiblTI4Z/NMhcViI5
	Ho0g==
X-Gm-Message-State: AOAM530nDO5xvkrqx6hTZA9V/yOh5WodTNE93wdg2MwNkUx2vpaUsedY
	//ah2DlOdzCQRPjOXyJDOGhb6uw9v9oxdNcYuWb+hRSgPq8jX3KqgOIiSTas8H8fe4L7vP8Qo+x
	WuIETqUqRn3hwpF+qCsw22yYV4OXGUA==
X-Received: by 2002:a05:6830:1052:: with SMTP id
	b18mr3064477otp.91.1612979795794; 
	Wed, 10 Feb 2021 09:56:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkHx3K+MlUnAczQvQAWhgp1flKNOASR1iMUf+ygLmGu5Mtfx52nmkJbDZtJ3Zm3Eb54u/LzoEE+SqnYNGEGWk=
X-Received: by 2002:a05:6830:1052:: with SMTP id
	b18mr3064460otp.91.1612979795609; 
	Wed, 10 Feb 2021 09:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20210122152556.24822-1-ntsironis@arrikto.com>
In-Reply-To: <20210122152556.24822-1-ntsironis@arrikto.com>
From: Ming Hung Tsai <mtsai@redhat.com>
Date: Thu, 11 Feb 2021 01:56:24 +0800
Message-ID: <CALjSBEuWgLHiPwkrMCpUWWV3VOOO98ZydCrzs1_qvCjSnyO5GQ@mail.gmail.com>
To: dm-devel@redhat.com, ntsironis@arrikto.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Edward Thornber <ejt@redhat.com>, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/4] dm era: Various minor fixes
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

On Fri, Jan 22, 2021 at 11:30 PM Nikos Tsironis <ntsironis@arrikto.com> wrote:
>
> While working on fixing the bugs that cause lost writes, for which I
> have sent separate emails, I bumped into several other minor issues that
> I fix in this patch set.
>
> In particular, this series of commits introduces the following fixes:
>
> 1. Add explicit check that the data block size hasn't changed
> 2. Fix bitset memory leaks. The in-core bitmaps were never freed.
> 3. Fix the writeset tree equality test function to use the right value
>    size.
> 4. Remove unreachable resize operation in pre-resume function.
>
> More information about the fixes can be found in their commit messages.
>
> Nikos Tsironis (4):
>   dm era: Verify the data block size hasn't changed
>   dm era: Fix bitset memory leaks
>   dm era: Use correct value size in equality function of writeset tree
>   dm era: Remove unreachable resize operation in pre-resume function
>
>  drivers/md/dm-era-target.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)

For the series, except 4/4 where I haven't tried other solutions.

Reviewed-by: Ming-Hung Tsai <mtsai@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


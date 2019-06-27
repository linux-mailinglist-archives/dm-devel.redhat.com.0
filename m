Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E958EB0
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 01:42:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF9AF85541;
	Thu, 27 Jun 2019 23:42:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6063B608A7;
	Thu, 27 Jun 2019 23:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2E441806B19;
	Thu, 27 Jun 2019 23:42:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RNfwdr023229 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 19:41:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CFDD1001B23; Thu, 27 Jun 2019 23:41:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A6FA1001B05;
	Thu, 27 Jun 2019 23:41:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D996B37F46;
	Thu, 27 Jun 2019 23:41:52 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DC31F208E3;
	Thu, 27 Jun 2019 23:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561678912;
	bh=78SChau8nc/c1cE2Dc8hBwWP8MHlNLa/2/RRRHYTTBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WY42jKzHRez627ToGgM55/WghYYH2Kd/+jPHX6Bn8WWc+PNCFMvfO8Ms8jKvtvqEq
	m+4id6Is6WVNgVPDJ4B7svfCYUI4T4NeIIH/uolDIlsQLR8LOqMDxgWesIKgYb1WDj
	5d/i1PKbaPL+t3T5LyL001tJIEHEXuDdUotEqFh4=
Date: Thu, 27 Jun 2019 16:41:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Message-ID: <20190627234149.GA212823@gmail.com>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Jun 2019 23:41:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 27 Jun 2019 23:41:53 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.934  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 1/1] Add dm verity root hash pkcs7 sig
	validation.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 27 Jun 2019 23:42:53 +0000 (UTC)

Hi Jaskaran, one comment (I haven't reviewed this in detail):

On Wed, Jun 19, 2019 at 12:10:48PM -0700, Jaskaran Khurana wrote:
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index db269a348b20..2d658a3512cb 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -475,6 +475,7 @@ config DM_VERITY
>  	select CRYPTO
>  	select CRYPTO_HASH
>  	select DM_BUFIO
> +	select SYSTEM_DATA_VERIFICATION
>  	---help---
>  	  This device-mapper target creates a read-only device that
>  	  transparently validates the data on one underlying device against
> diff --git a/drivers/md/Makefile b/drivers/md/Makefile
> index be7a6eb92abc..3b47b256b15e 100644
> --- a/drivers/md/Makefile
> +++ b/drivers/md/Makefile
> @@ -18,7 +18,7 @@ dm-cache-y	+= dm-cache-target.o dm-cache-metadata.o dm-cache-policy.o \
>  		    dm-cache-background-tracker.o
>  dm-cache-smq-y   += dm-cache-policy-smq.o
>  dm-era-y	+= dm-era-target.o
> -dm-verity-y	+= dm-verity-target.o
> +dm-verity-y	+= dm-verity-target.o dm-verity-verify-sig.o
>  md-mod-y	+= md.o md-bitmap.o
>  raid456-y	+= raid5.o raid5-cache.o raid5-ppl.o
>  dm-zoned-y	+= dm-zoned-target.o dm-zoned-metadata.o dm-zoned-reclaim.o

Perhaps this should be made optional and controlled by a kconfig option
CONFIG_DM_VERITY_SIGNATURE_VERIFICATION, similar to CONFIG_DM_VERITY_FEC?

CONFIG_SYSTEM_DATA_VERIFICATION brings in a lot of stuff, which might be
unnecessary for some dm-verity users.  Also, you've already separated most of
the code out into a separate .c file anyway.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

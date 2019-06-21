Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4E4E01F
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jun 2019 07:42:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 400316EB82;
	Fri, 21 Jun 2019 05:41:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D97521001B28;
	Fri, 21 Jun 2019 05:41:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAAB3C57E;
	Fri, 21 Jun 2019 05:40:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5L5dgXE023587 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 01:39:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D62B1608A7; Fri, 21 Jun 2019 05:39:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A6360852
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 05:39:40 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6844F30C084B
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 05:39:33 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j6so128007ioa.5
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 22:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mELfp6zRiexEAAqmgN6eWetdKn6WzfvAuPTZHTzVDWY=;
	b=svF7VF+qCnzPwCwMCoZ+RtNCIB1W6c/EC80WLwt1DlIaQ9mlIgSqUyd8LrbJcvpAk7
	/kPVCZGWvfvbEeW4rOawCrCoDamBpdmjQ3qHOQ9vfopNyJY6YVu4m/R/PvxGSKt6s3DK
	hjKsD7ews8DXFV8COLiSZXxI609fkYzy+qTzZCpe7klu1yK6YzEuuMtz6f+2UYq73vSi
	NW1xE60yZmMXXy1e9Rnncyr0dQXgRMffhuOtaUufcrvaEysR64Cz3jiN6gp3lGeB6E6T
	gph/8QO05dZ/DIZqI7DCQworhTWlWwx+W4b7juW7Orui4vGIs2K45AHOfbXXHi16kNNS
	ymCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mELfp6zRiexEAAqmgN6eWetdKn6WzfvAuPTZHTzVDWY=;
	b=r5LII9OrqyZmIQ8AidYiP4WivIrYAeagQ7R8QHc+u9ezCuqtJR3fW4XPd2AbVtWMga
	NB4E5rqOplFeKRjTlepzvdo0YELNnDULL4xT4m/JTHvZb+SNhwmVcENhfMqn57kFs0GT
	d6mSj4eg3sgtuSqEID04eKBL5s8Uj3TXiV+XHqCNR2sMTBNOIJUaqIJObUJvPU5duYzo
	9NbjAbwMgbAZVzmb9FFpFRgP9wJdclDbAqDZVE9oadDM+mUTZBNNXwKlwCoPltUybAXQ
	Re6Rc0vX475DgyfR3ZG/PnM2e2b3l6XiOF1dV6A9eu6g8ytCaQsRzvRG2nQjOny+G2hX
	GEmQ==
X-Gm-Message-State: APjAAAXjzLEvl63eJPeG5iB6omNpKORpyVGNgTsJKwmGACHZYQDx+xQF
	qc83G1g6pdSMXnp51BGtREsPo/11DEPAGDzj/7XkyQ==
X-Google-Smtp-Source: APXvYqwqwaQdBl4xxaWd9W0wXDLMctP1dBqHsxmbtoY+rcrFS2Ha4qhnpo3ck9WLvMCF2o0xS8ZfyOMWRx02fDNfqZk=
X-Received: by 2002:a02:6597:: with SMTP id u145mr9933869jab.26.1561095572685; 
	Thu, 20 Jun 2019 22:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
	<20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
	<CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
	<20190620134045.fncibzc7eyufd5sj@gondor.apana.org.au>
	<CAKv+Gu8OFbDJGoYw_DHresF5HJDSamtw1YtZ13gpOVJCYV+22Q@mail.gmail.com>
	<20190621010657.foscl7aaxlx7tfuy@gondor.apana.org.au>
In-Reply-To: <20190621010657.foscl7aaxlx7tfuy@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 21 Jun 2019 07:39:21 +0200
Message-ID: <CAKv+Gu9DuYvMA7yOTT3p75hvNHY_LOaDBE_oCdxB=SRFZ7U-kA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 21 Jun 2019 05:39:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 21 Jun 2019 05:39:33 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 1/6] crypto: essiv - create wrapper
	template for ESSIV generation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 21 Jun 2019 05:42:03 +0000 (UTC)

On Fri, 21 Jun 2019 at 03:07, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jun 20, 2019 at 03:53:45PM +0200, Ard Biesheuvel wrote:
> >
> > We'd need at least 512 and 4k for dm-crypt, but I don't think the
> > sector size is limited at all tbh
>
> In that case my preference would be to encode this into the key
> and hardware that encounters unsupported sector sizes can use a
> fallback.
>

OTOH, it also depends on what makes sense to implement in practice.

Gilad, I suppose sector size 512 is an obvious win, since the OS
always fetches at least 8 consective ones at a time. Do you see a
benefit for other sector sizes as well?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

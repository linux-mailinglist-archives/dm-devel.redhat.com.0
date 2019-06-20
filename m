Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76C4CFA6
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 15:54:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D8D73086236;
	Thu, 20 Jun 2019 13:54:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 119531972A;
	Thu, 20 Jun 2019 13:54:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F1E0206D3;
	Thu, 20 Jun 2019 13:54:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KDs76o001981 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:54:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C721019733; Thu, 20 Jun 2019 13:54:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C20FE1972A
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:54:05 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 529D036807
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:53:57 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i10so1047981iol.13
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X0vIXNw6IkK7+noGSyo5S+Vhxo01kIr5An5KCT/yZtQ=;
	b=KlTKFNO13ZwaLx0eExtpcBtMCOu5xdOL29sS9i/Lyz6IO//LHdBSWp6aDwUbq+n9F1
	CABMLheQqbvmE5ZRnv+i+gi4/MHqWbiX45/2e6DMzj3X0aSKoyPMgo5TlAo4BpexecDN
	ymOq+dE9aGEwWraSCjCtIZgHBcqKFrGsoynePjm74o6khNuewS+AAEv8Kk/qKgGzWR51
	o9QpnZnKQy4bNCR4JxzrIbLNRvN24VAfDYzsTMCotz2YV3q/Jh9STqEyYd+AT8YfQ8yt
	Pn7sHwsODlaIpM04IViHyrtMB1aannx5L184Oh9qrVz82MlLAVYhG+ZCQjJC8PHxdv4g
	8lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X0vIXNw6IkK7+noGSyo5S+Vhxo01kIr5An5KCT/yZtQ=;
	b=E23QDymbvPWGs2e+1CL/LYHl7/nIoMRLSuUte3e3haaxzVnqwNUxsphxwXSToX06kI
	cR+bPcj2qQcgUeH0Wwx24UTmrkfCKgmztQSBYPcukyn8XbWntm2sTJDKlqst7PqmqAWK
	DeVnHH1QEimxKfojDixmnAHMrLqQyK1vfgZvAUzFu61d6PrlpCbVnApZn0m4Tyw2Gb8z
	LQ6o3UqkZZV7g+iWeq+GHs4exQvc79vtT/SYuF2JkRSrZKnW5CVs67cwbavQ3Dsz6WLP
	95OCOhimRKV+iYLKfBi42IJflwOmizjkupBe0Do8QHRZL0AtnQkZa6ZaaqOIB53W9Nai
	5o3Q==
X-Gm-Message-State: APjAAAVNbQSnA9iZ+zZfnbSil+AU/r2E+OpSMyopgHeIcLSBHNahKBvs
	vvOFmqzsR4SmaBLjOw+EnIzRvGwwbEMh20n01TiChw==
X-Google-Smtp-Source: APXvYqwtfZzrYQMbQkOK6e3dZ11mzuRUTZK3eybV3NTUaN9QmoMQSIWPRiU3as2yid/Ysmd6prgeaCjN26BdpXRnHzA=
X-Received: by 2002:a02:3308:: with SMTP id c8mr35402333jae.103.1561038836657; 
	Thu, 20 Jun 2019 06:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
	<20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
	<CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
	<20190620134045.fncibzc7eyufd5sj@gondor.apana.org.au>
In-Reply-To: <20190620134045.fncibzc7eyufd5sj@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 15:53:45 +0200
Message-ID: <CAKv+Gu8OFbDJGoYw_DHresF5HJDSamtw1YtZ13gpOVJCYV+22Q@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Jun 2019 13:53:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 20 Jun 2019 13:53:57 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 20 Jun 2019 13:54:53 +0000 (UTC)

On Thu, 20 Jun 2019 at 15:40, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jun 20, 2019 at 03:02:04PM +0200, Ard Biesheuvel wrote:
> >
> > It also depend on how realistic it is that we will need to support
> > arbitrary sector sizes in the future. I mean, if we decide today that
> > essiv() uses an implicit sector size of 4k, we can always add
> > essiv64k() later, rather than adding lots of complexity now that we
> > are never going to use. Note that ESSIV is already more or less
> > deprecated, so there is really no point in inventing these weird and
> > wonderful things if we want people to move to XTS and plain IV
> > generation instead.
>
> Well whatever we do for ESSIV should also extend to other IV
> generators in dm-crypt so that potentially we can have a single
> interface for dm-crypt multi-sector processing in future (IOW
> you don't have special code for ESSIV vs. other algos).
>
> That is why we should get the ESSIV interface right as it could
> serve as an example for future implementations.
>
> What do the dm-crypt people think? Are you ever going to need
> processing in units other than 4K?
>

We'd need at least 512 and 4k for dm-crypt, but I don't think the
sector size is limited at all tbh

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

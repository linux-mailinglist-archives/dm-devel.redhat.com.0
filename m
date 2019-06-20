Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 279844CF26
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 15:41:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B10B883D7;
	Thu, 20 Jun 2019 13:41:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6A7C19C4F;
	Thu, 20 Jun 2019 13:41:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 856531806B0F;
	Thu, 20 Jun 2019 13:41:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KDeukk031758 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:40:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2145C5C221; Thu, 20 Jun 2019 13:40:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from deadmen.hmeau.com (ovpn-12-158.pek2.redhat.com [10.72.12.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBF985C21E
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:40:53 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hdxJ1-000366-G4; Thu, 20 Jun 2019 21:40:47 +0800
Received: from herbert by gondobar with local (Exim 4.89)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hdxIz-0006ry-GR; Thu, 20 Jun 2019 21:40:45 +0800
Date: Thu, 20 Jun 2019 21:40:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190620134045.fncibzc7eyufd5sj@gondor.apana.org.au>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
	<20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
	<CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 20 Jun 2019 13:41:50 +0000 (UTC)

On Thu, Jun 20, 2019 at 03:02:04PM +0200, Ard Biesheuvel wrote:
>
> It also depend on how realistic it is that we will need to support
> arbitrary sector sizes in the future. I mean, if we decide today that
> essiv() uses an implicit sector size of 4k, we can always add
> essiv64k() later, rather than adding lots of complexity now that we
> are never going to use. Note that ESSIV is already more or less
> deprecated, so there is really no point in inventing these weird and
> wonderful things if we want people to move to XTS and plain IV
> generation instead.

Well whatever we do for ESSIV should also extend to other IV
generators in dm-crypt so that potentially we can have a single
interface for dm-crypt multi-sector processing in future (IOW
you don't have special code for ESSIV vs. other algos).

That is why we should get the ESSIV interface right as it could
serve as an example for future implementations.

What do the dm-crypt people think? Are you ever going to need
processing in units other than 4K?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

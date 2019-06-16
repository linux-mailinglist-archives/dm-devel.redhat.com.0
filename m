Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E0476EC
	for <lists+dm-devel@lfdr.de>; Sun, 16 Jun 2019 23:09:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C1213DE10;
	Sun, 16 Jun 2019 21:09:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27EEB648B0;
	Sun, 16 Jun 2019 21:09:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79977C57E;
	Sun, 16 Jun 2019 21:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5GL99cV030734 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 16 Jun 2019 17:09:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C01816136A; Sun, 16 Jun 2019 21:09:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B868E179BA;
	Sun, 16 Jun 2019 21:09:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6943E30833A1;
	Sun, 16 Jun 2019 21:09:06 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 731C32084D;
	Sun, 16 Jun 2019 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560719345;
	bh=GTQ0Rb1obiOnV/loBYnTUldGJZLtLtyNtKdBjRCT2WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xltwFOLyMNBwP569RW8nfVX87xkROwc6ffnB9dNtW6AFnDAh80Y+EQBzV8dsCi+dN
	BWL8tW67Wvqq2wBSh0tyfQiVhUmCjZdGOm/UTpDPk+s1w5FARQOBC1b0yayfi2Rxsg
	4PoqnST+b0yaxcSjh37V+939+TrtkzXSfV80lntg=
Date: Sun, 16 Jun 2019 14:09:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190616210903.GF923@sol.localdomain>
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<9cd635ec-970b-bd1b-59f4-1a07395e69a0@gmail.com>
	<CAKv+Gu88tYOmO=8mi7yP2oj=x_SOB_o7D9jo6v_3xfbUxY2R1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu88tYOmO=8mi7yP2oj=x_SOB_o7D9jo6v_3xfbUxY2R1A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sun, 16 Jun 2019 21:09:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sun, 16 Jun 2019 21:09:06 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
 generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sun, 16 Jun 2019 21:09:24 +0000 (UTC)

[+Cc linux-fscrypt]

On Sun, Jun 16, 2019 at 09:13:01PM +0200, Ard Biesheuvel wrote:
> >
> >  - ESSIV is useful only for CBC mode. I wish we move to some better mode
> > in the future instead of cementing CBC use... But if it helps people
> > to actually use unpredictable IV for CBC, it is the right approach.
> > (yes, I know XTS has own problems as well... but IMO that should be the default
> > for sector/fs-block encryption these days :)
> >
> 
> I agree that XTS should be preferred. But for some reason, the
> kernel's XTS implementation does not support ciphertext stealing (as
> opposed to, e.g., OpenSSL), and so CBC ended up being used for
> encrypting the filenames in fscrypt.
> 

Actually, for fscrypt CTS-CBC was also chosen because all filenames in each
directory use the same IV, in order to efficiently support all the possible
filesystem operations and to support filenames up to NAME_MAX.  So there was a
desire for there to be some propagation across ciphertext blocks rather than use
XTS which would effectively be ECB in this case.

Neither solution is great though, since CBC-CTS still has the common prefix
problem.  Long-term we're planning to switch to an AES-based wide block mode
such as AES-HEH or AES-HCTR for filenames encryption.  This is already solved
for Adiantum users since Adiantum is a wide-block mode, but there should be a
pure AES solution too to go along with AES contents encryption.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

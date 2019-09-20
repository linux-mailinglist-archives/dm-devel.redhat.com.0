Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6AB9916
	for <lists+dm-devel@lfdr.de>; Fri, 20 Sep 2019 23:32:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE5C33082E10;
	Fri, 20 Sep 2019 21:31:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C17A6600C6;
	Fri, 20 Sep 2019 21:31:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E082F1800B74;
	Fri, 20 Sep 2019 21:31:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8KLRp9E008030 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Sep 2019 17:27:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D2E65D9E5; Fri, 20 Sep 2019 21:27:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4756E5DA8D;
	Fri, 20 Sep 2019 21:27:47 +0000 (UTC)
Date: Fri, 20 Sep 2019 17:27:46 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20190920212746.GA22061@redhat.com>
References: <20190920154434.GA923@gandi.net>
	<20190920173707.GA21143@redhat.com>
	<13e25b01-f344-ea1d-8f6c-9d0a60eb1e0f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13e25b01-f344-ea1d-8f6c-9d0a60eb1e0f@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Thibaut Sautereau <thibaut.sautereau@clip-os.org>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] dm-crypt error when CONFIG_CRYPTO_AUTHENC is disabled
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 20 Sep 2019 21:32:01 +0000 (UTC)

On Fri, Sep 20 2019 at  3:21pm -0400,
Milan Broz <gmazyland@gmail.com> wrote:

> On 20/09/2019 19:37, Mike Snitzer wrote:
> > On Fri, Sep 20 2019 at 11:44am -0400,
> > Thibaut Sautereau <thibaut.sautereau@clip-os.org> wrote:
> > 
> >> Hi,
> >>
> >> I just got a dm-crypt "crypt: Error allocating crypto tfm" error when
> >> trying to "cryptsetup open" a volume. I found out that it was only
> >> happening when I disabled CONFIG_CRYPTO_AUTHENC.
> >>
> >> drivers/md/dm-crypt.c includes the crypto/authenc.h header and seems to
> >> use some CRYPTO_AUTHENC-related stuff. Therefore, shouldn't
> >> CONFIG_DM_CRYPT select CONFIG_CRYPTO_AUTHENC?
> > 
> > Yes, it looks like commit ef43aa38063a6 ("dm crypt: add cryptographic
> > data integrity protection (authenticated encryption)") should've added
> > 'select CRYPTO_AUTHENC' to dm-crypt's Kconfig.  I'll let Milan weigh-in
> > but that seems like the right way forward.
> 
> No, I don't this so. It is like you use some algorithm that is just not compiled-in,
> or it is disabled in the current state (because of FIPS mode od so) - it fails
> to initialize it.
> 
> I think we should not force dm-crypt to depend on AEAD - most users
> do not use authenticated encryption, it is perfectly ok to keep this compiled out.
> 
> I do not see any principal difference from disabling any other crypto
> (if you disable XTS mode, it fails to open device that uses it).
> 
> IMO the current config dependence is ok.

That is a good point.  I hadn't considered the kernel compiles just fine
without CRYPTO_AUTHENC.. which it clearly does.

SO I retract the question/thought of updating the Kconfig for dm-crypt
in my previous mail.

Though in hindsight: wonder whether the dm-integrity based dm-crypt
authenticated encryption support should have been exposed as a proper
CONFIG option within the DM_CRYPT section?  Rather than lean on the
crypto subsystem to happily stub out the dm-crypt AEAD and AUTHENC
related code dm-crypt could've established #ifdef boundaries for that
code.

I'm open to suggestions and/or confirmation that the way things are now
is perfectly fine.  But I do see this report as something that should
drive some improvement.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B54BAFC7
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 10:39:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D92F5307D8BE;
	Mon, 23 Sep 2019 08:39:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFFF36017E;
	Mon, 23 Sep 2019 08:39:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53BB54EE50;
	Mon, 23 Sep 2019 08:39:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8N8KUXA019463 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 04:20:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8E5360600; Mon, 23 Sep 2019 08:20:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA10F60852;
	Mon, 23 Sep 2019 08:20:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
	[217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 442E210CC1E1;
	Mon, 23 Sep 2019 08:20:19 +0000 (UTC)
X-Originating-IP: 90.63.246.187
Received: from gandi.net (lmontsouris-657-1-214-187.w90-63.abo.wanadoo.fr
	[90.63.246.187])
	(Authenticated sender: thibaut.sautereau@clip-os.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 300A2E0012;
	Mon, 23 Sep 2019 08:20:17 +0000 (UTC)
Date: Mon, 23 Sep 2019 10:20:16 +0200
From: Thibaut Sautereau <thibaut.sautereau@clip-os.org>
To: Mike Snitzer <snitzer@redhat.com>, Milan Broz <gmazyland@gmail.com>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	linux-kernel@vger.kernel.org
Message-ID: <20190923082016.GA913@gandi.net>
References: <20190920154434.GA923@gandi.net>
	<20190920173707.GA21143@redhat.com>
	<13e25b01-f344-ea1d-8f6c-9d0a60eb1e0f@gmail.com>
	<20190920212746.GA22061@redhat.com>
	<20190920214758.GA162854@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920214758.GA162854@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Mon, 23 Sep 2019 08:20:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 23 Sep 2019 08:20:21 +0000 (UTC) for IP:'217.70.183.196'
	DOMAIN:'relay4-d.mail.gandi.net' HELO:'relay4-d.mail.gandi.net'
	FROM:'thibaut.sautereau@clip-os.org' RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 217.70.183.196 relay4-d.mail.gandi.net
	217.70.183.196 relay4-d.mail.gandi.net
	<thibaut.sautereau@clip-os.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 04:38:28 -0400
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 23 Sep 2019 08:39:24 +0000 (UTC)

On Fri, Sep 20, 2019 at 02:47:59PM -0700, Eric Biggers wrote:
> On Fri, Sep 20, 2019 at 05:27:46PM -0400, Mike Snitzer wrote:
> > On Fri, Sep 20 2019 at  3:21pm -0400,
> > Milan Broz <gmazyland@gmail.com> wrote:
> > 
> > > On 20/09/2019 19:37, Mike Snitzer wrote:
> > > > On Fri, Sep 20 2019 at 11:44am -0400,
> > > > Thibaut Sautereau <thibaut.sautereau@clip-os.org> wrote:
> > > > 
> > > >> Hi,
> > > >>
> > > >> I just got a dm-crypt "crypt: Error allocating crypto tfm" error when
> > > >> trying to "cryptsetup open" a volume. I found out that it was only
> > > >> happening when I disabled CONFIG_CRYPTO_AUTHENC.
> > > >>
> > > >> drivers/md/dm-crypt.c includes the crypto/authenc.h header and seems to
> > > >> use some CRYPTO_AUTHENC-related stuff. Therefore, shouldn't
> > > >> CONFIG_DM_CRYPT select CONFIG_CRYPTO_AUTHENC?
> > > > 
> > > > Yes, it looks like commit ef43aa38063a6 ("dm crypt: add cryptographic
> > > > data integrity protection (authenticated encryption)") should've added
> > > > 'select CRYPTO_AUTHENC' to dm-crypt's Kconfig.  I'll let Milan weigh-in
> > > > but that seems like the right way forward.
> > > 
> > > No, I don't this so. It is like you use some algorithm that is just not compiled-in,
> > > or it is disabled in the current state (because of FIPS mode od so) - it fails
> > > to initialize it.
> > > 
> > > I think we should not force dm-crypt to depend on AEAD - most users
> > > do not use authenticated encryption, it is perfectly ok to keep this compiled out.
> > > 
> > > I do not see any principal difference from disabling any other crypto
> > > (if you disable XTS mode, it fails to open device that uses it).

Fair enough. However, in the XTS case you mention, I think it's easier
to remember that you set up XTS mode for your disk encryption and thus
that you should enable it in your config. By the way, the CRYPTO_AUTHENC
Kconfig help text only and specifically mentions IPsec, which can be a
lot confusing for people trying to find out what option of which they
got rid is actually causing an issue.

On top of that, there's no hint in kernel logs about a particular
algorithm, feature or Kconfig option that could be missing. Do we really
expect people simply tuning their kernel configuration to go and read
the source code to ensure they are not breaking their system?

As for your "most users do not use authenticated encryption" argument, I
agree, but note that cryptsetup with LUKS2 makes it quite easy to setup
authenticated disk encryption, and I bet more and more people are using
it. It's working most of the time because people are either using a
distro kernel with everything enabled, or compiling their own one but
being security-minded enough to use stuff like IPsec which then selects
CRYPTO_AUTHENC.

> > > 
> > > IMO the current config dependence is ok.
> > 
> > That is a good point.  I hadn't considered the kernel compiles just fine
> > without CRYPTO_AUTHENC.. which it clearly does.
> > 
> > SO I retract the question/thought of updating the Kconfig for dm-crypt
> > in my previous mail.
> > 
> > Though in hindsight: wonder whether the dm-integrity based dm-crypt
> > authenticated encryption support should have been exposed as a proper
> > CONFIG option within the DM_CRYPT section?  Rather than lean on the
> > crypto subsystem to happily stub out the dm-crypt AEAD and AUTHENC
> > related code dm-crypt could've established #ifdef boundaries for that
> > code.
> > 
> > I'm open to suggestions and/or confirmation that the way things are now
> > is perfectly fine.  But I do see this report as something that should
> > drive some improvement.
> > 
> 
> FWIW, I think you're being saved right now by the craziness in the crypto
> subsystem Kconfig options: CONFIG_DM_CRYPT selects CONFIG_CBC, which selects
> CONFIG_CRYPTO_MANAGER, which selects CONFIG_CRYPTO_MANAGER2, which selects
> CONFIG_CRYPTO_AEAD2 (and all the other algorithm types, for that matter).
> This makes the AEAD API available.
> 
> If this wasn't the case, dm-crypt's use of crypto_alloc_aead() would be causing
> a link error in some kernel configurations, since CONFIG_DM_CRYPT doesn't
> actually select the AEAD API itself.
> 
> At some point I (or someone else up to the task) might try to fix the crypto
> subsystem to not make every template select every algorithm type.  In that
> happens, we'll need to update the users like dm-crypt to explicitly select the
> algorithm types they're using, if they were being implicitly selected before.
> 
> In any case, allowing users to compile out the AEAD support in dm-crypt would
> also be nice if it's not too difficult, since not everyone needs it.

After reading all that, I'm wondering if this is not a good example of
where the "imply" keyword should be used.

Thanks for your hindsight,

-- 
Thibaut Sautereau
CLIP OS developer

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

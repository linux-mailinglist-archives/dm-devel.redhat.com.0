Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1458D277304
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600955225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yck2tR5eSdj4HT1vZ4EGYwIDasNe2kTEmImcCs7uyaE=;
	b=Dbvaw6Kk5LfAK7gF1kCN/LuAF70qOB9+jQ1PGnWxigYjoEBN4SZdGAlgul00WrSu/DV3O1
	ANmlc+ry6k3ChXWvAkeaiCvRwPfKP5gUl5ejQN+uXNkUSrcBXh1KMFW5o3NYvtvt+d29al
	wDwT/SelFLoyZBLiET3T8+bxL1gasIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-DA9z8kQYM0CuFcxiWO-pEg-1; Thu, 24 Sep 2020 09:47:02 -0400
X-MC-Unique: DA9z8kQYM0CuFcxiWO-pEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C8C186DD34;
	Thu, 24 Sep 2020 13:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A213A702E7;
	Thu, 24 Sep 2020 13:46:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BF7D8C7A2;
	Thu, 24 Sep 2020 13:46:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODkrtN027979 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:46:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1BCA702E7; Thu, 24 Sep 2020 13:46:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F38C59CBA;
	Thu, 24 Sep 2020 13:46:49 +0000 (UTC)
Date: Thu, 24 Sep 2020 09:46:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200924134649.GB13849@redhat.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200922003255.GC32959@sol.localdomain>
	<20200924011438.GD10500@redhat.com>
	<20200924071721.GA1883346@google.com>
MIME-Version: 1.0
In-Reply-To: <20200924071721.GA1883346@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] dm: add support for passing through
 inline crypto support
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at  3:17am -0400,
Satya Tangirala <satyat@google.com> wrote:

> On Wed, Sep 23, 2020 at 09:14:39PM -0400, Mike Snitzer wrote:
> > On Mon, Sep 21 2020 at  8:32pm -0400,
> > Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > > On Wed, Sep 09, 2020 at 11:44:21PM +0000, Satya Tangirala wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > Update the device-mapper core to support exposing the inline crypto
> > > > support of the underlying device(s) through the device-mapper device.
> > > > 
> > > > This works by creating a "passthrough keyslot manager" for the dm
> > > > device, which declares support for encryption settings which all
> > > > underlying devices support.  When a supported setting is used, the bio
> > > > cloning code handles cloning the crypto context to the bios for all the
> > > > underlying devices.  When an unsupported setting is used, the blk-crypto
> > > > fallback is used as usual.
> > > > 
> > > > Crypto support on each underlying device is ignored unless the
> > > > corresponding dm target opts into exposing it.  This is needed because
> > > > for inline crypto to semantically operate on the original bio, the data
> > > > must not be transformed by the dm target.  Thus, targets like dm-linear
> > > > can expose crypto support of the underlying device, but targets like
> > > > dm-crypt can't.  (dm-crypt could use inline crypto itself, though.)
> > > > 
> > > > When a key is evicted from the dm device, it is evicted from all
> > > > underlying devices.
> > > > 
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > Co-developed-by: Satya Tangirala <satyat@google.com>
> > > > Signed-off-by: Satya Tangirala <satyat@google.com>
> > > 
> > > Looks good as far as Satya's changes from my original patch are concerned.
> > > 
> > > Can the device-mapper maintainers take a look at this?
> > 
> > In general it looks like these changes were implemented very carefully
> > and are reasonable if we _really_ want to enable passing through inline
> > crypto.
> > 
> > I do have concerns about the inability to handle changes at runtime (due
> > to a table reload that introduces new devices without the encryption
> > settings the existing devices in the table are using).  But the fallback
> > mechanism saves it from being a complete non-starter.
>
> Unfortunately, the fallback doesn't completely handle that situation
> right now. The DM device could be suspended while an upper layer like
> fscrypt is doing something like "checking if encryption algorithm 'A'
> is supported by the DM device". It's possible that fscrypt thinks
> the DM device supports 'A' even though the DM device is suspended, and
> the table is about to be reloaded to introduce a new device that doesn't
> support 'A'. Before the DM device is resumed with the new table, fscrypt
> might send a bio that uses encryption algorithm 'A' without initializing
> the blk-crypto-fallback ciphers for 'A', because it believes that the DM
> device supports 'A'. When the bio gets processed by the DM (or when
> blk-crypto does its checks to decide whether to use the fallback on that
> bio), the bio will fail because the fallback ciphers aren't initialized.
> 
> Off the top of my head, one thing we could do is to always allocate the
> fallback ciphers when the device mapper is the target device for the bio
> (by maybe adding a "encryption_capabilities_may_change_at_runtime" flag
> to struct blk_keyslot_manager that the DM will set to true, and that
> the block layer will check for and decide to appropriately allocate
> the fallback ciphers), although this does waste memory on systems
> where we know the DM device tables will never change....

Yeah, I agree that'd be too wasteful.
 
> This patch also doesn't handle the case when the encryption capabilities
> of the new table are a superset of the old capabilities.  Currently, a
> DM device's capabilities can only shrink after the device is initially
> created. They can never "expand" to make use of capabilities that might
> be added due to introduction of new devices via table reloads.  I might
> be forgetting something I thought of before, but looking at it again
> now, I don't immediately see anything wrong with expanding the
> advertised capabilities on table reload....I'll look carefully into that
> again.

OK, that'd be good (expanding capabilities on reload).

And conversely, you _could_ also fail a reload if the new device(s)
don't have capabilities that are in use by the active table.

> > Can you help me better understand the expected consumer of this code?
> > If you have something _real_ please be explicit.  It makes justifying
> > supporting niche code like this more tolerable.
>
> So the motivation for this code was that Android currently uses a device
> mapper target on top of a phone's disk for user data. On many phones,
> that disk has inline encryption support, and it'd be great to be able to
> make use of that. The DM device configuration isn't changed at runtime.

OK, which device mapper target is used?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


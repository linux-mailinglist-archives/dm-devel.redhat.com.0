Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A76AA6B
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jul 2019 16:14:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EC1E308FE8D;
	Tue, 16 Jul 2019 14:14:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41E095D784;
	Tue, 16 Jul 2019 14:14:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 301711972E;
	Tue, 16 Jul 2019 14:14:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GEEJcx006099 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 10:14:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37CF0608A6; Tue, 16 Jul 2019 14:14:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9D060920;
	Tue, 16 Jul 2019 14:14:16 +0000 (UTC)
Date: Tue, 16 Jul 2019 10:14:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190716141415.GB17023@redhat.com>
References: <20190603134017.9323-1-ntsironis@arrikto.com>
	<b6cdb071-f8d3-7c09-c938-71689ceb1c95@arrikto.com>
	<20190715182221.GB15315@redhat.com>
	<54f185d8-5cf7-b617-1dfe-418da7643004@arrikto.com>
	<20190716141150.GA17023@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716141150.GA17023@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm kcopyd: Increase sub-job size to 512KiB
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 16 Jul 2019 14:14:25 +0000 (UTC)

On Tue, Jul 16 2019 at 10:11am -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Tue, Jul 16 2019 at  9:59am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
> > On 7/15/19 9:22 PM, Mike Snitzer wrote:
> > > On Fri, Jul 12 2019 at  9:45am -0400,
> > > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > > 
> > >> Hi Mike,
> > >>
> > >> A kind reminder about this patch. Do you require any changes or will you
> > >> merge it as is?
> > > 
> > > I think we need changes to expose knob(s) to tune this value on a global
> > > _and_ device level via sysfs.  E.g.:
> > > 
> > > 1) dm_mod module param for global
> > > 2) but also allow a per-device override, like:
> > >    echo 512 > /sys/block/dm-X/dm/kcopyd_subjob_size
> > > 
> > 
> > Hi Mike,
> > 
> > Thanks for your feedback. I agree, this sounds like the best thing to do.
> > 
> > > 1 is super easy and is a start.  Layering in 2 is a bit more involved.
> > 
> > Maybe I could help with (2). We could discuss about it and how you think
> > it's best to do it and then I could proceed with an implementation.
> > 
> > Please let me know what you think.
> > 
> > > 
> > > In hindsight (given how risk-averse I am on changing the default) I
> > > should've kept the default 128 but allowed override with modparam
> > > dm_mod.kcopyd_subjob_size=1024
> > > 
> > > Would this be an OK first step?
> > 
> > Yes, this would be great.
> > 
> > > 
> > > If so, we're still in the 5.3 merge window, I'll see what I can do.
> > 
> > Shall I proceed with a patch adding the dm_mod.kcopyd_subjob_size
> > modparam?
> 
> Sure.  And it could be that we won't need 2.
> 
> Ideally the default would work for every setup.  Less knobs the better.
> But as a stop-gap I think we need to expose a knob that allows override.
> 
> Thinking further, I don't think changing the default to 512K is too
> risky (famous last words).  So please just update your original patch to
> include the modparam so that users can get the old 64K back if needed.
> 
> BTW, the param name should probably be "kcopyd_subjob_size_kb" to
> reflect the value is KB.

One other thing: not sure what the max should be on this
modparam.. maybe 1024K?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

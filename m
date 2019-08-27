Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A69EF08
	for <lists+dm-devel@lfdr.de>; Tue, 27 Aug 2019 17:35:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F70A2BE94;
	Tue, 27 Aug 2019 15:35:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 662A5600D1;
	Tue, 27 Aug 2019 15:35:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F375C83542;
	Tue, 27 Aug 2019 15:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7RFYqvx027745 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 11:34:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 870571001B13; Tue, 27 Aug 2019 15:34:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B861001B09;
	Tue, 27 Aug 2019 15:34:48 +0000 (UTC)
Date: Tue, 27 Aug 2019 11:34:47 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190827153447.GA3920@redhat.com>
References: <20190709141522.29606-1-ntsironis@arrikto.com>
	<20190709141522.29606-2-ntsironis@arrikto.com>
	<a6d47841-fcbc-50b2-724c-082be9e764d1@redhat.com>
	<e2b23d5c-0ef2-400b-9697-3fb7899ce3e2@arrikto.com>
	<92afa0f6-90ac-7a3f-8d8a-78fa446fec73@redhat.com>
	<d06576ba-2bcf-5e6f-7f4b-5dec61c807b5@arrikto.com>
	<859d881b-2c33-f49d-2fac-fcd8a22810f5@redhat.com>
	<5c127a57-127b-ff2e-c3f6-5cef626b1367@arrikto.com>
	<0a780ffc-c34c-2da4-80d1-8598d116c93f@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a780ffc-c34c-2da4-80d1-8598d116c93f@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, agk@redhat.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm: add clone target
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 27 Aug 2019 15:35:12 +0000 (UTC)

On Tue, Aug 27 2019 at 10:09am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Hello,
> 
> This is a kind reminder for this patch set. I'm bumping this thread to
> solicit your feedback.
> 
> Following the discussion with Heinz, I have provided extensive
> benchmarks that show dm-clone's significant performance increase
> compared to a dm-snapshot/dm-raid1 stack.
> 
> How can we move forward with the review of dm-clone, so it can
> eventually be merged upstream?
> 
> Looking forward to your feedback,

I actually pulled it into my local dm-5.4 branch yesterday and have
started reviewing.  Firrst pass it looks like you've got solid code; a
lot of familiar code patterns too (barrowed from thinp, etc).

But the first thing that is tripping me up is the name "dm-clone"
considering how cloning is so fundamental to all DM.  The second term
that is just awkward is "hydration".  But that is just my initial
thought.  I'll need the rest of the week to really dig in and have more
constructive feedback for you.

Thanks for the ping; wasn't needed in this instance but it never hurts.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

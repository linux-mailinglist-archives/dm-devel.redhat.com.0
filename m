Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 245FAD10FB
	for <lists+dm-devel@lfdr.de>; Wed,  9 Oct 2019 16:14:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7FED3082135;
	Wed,  9 Oct 2019 14:14:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B0F5C1D6;
	Wed,  9 Oct 2019 14:13:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B06E7180085A;
	Wed,  9 Oct 2019 14:13:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x99EDEoi006952 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Oct 2019 10:13:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E72E36060D; Wed,  9 Oct 2019 14:13:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0CD460A9F;
	Wed,  9 Oct 2019 14:13:09 +0000 (UTC)
Date: Wed, 9 Oct 2019 10:13:08 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>,
	Guruswamy Basavaiah <guru2018@gmail.com>
Message-ID: <20191009141308.GA1670@redhat.com>
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] Fix "dm kcopyd: Fix bug causing workqueue stalls"
 causes dead lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 09 Oct 2019 14:14:05 +0000 (UTC)

On Tue, Oct 01 2019 at  8:43am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
> > Hello Nikos,
> >  Yes, issue is consistently reproducible with us, in a particular
> > set-up and test case.
> >  I will get the access to set-up next week, will try to test and let
> > you know the results before end of next week.
> > 
> 
> That sounds great!
> 
> Thanks a lot,
> Nikos

Hi Guru,

Any chance you could try this fix that I've staged to send to Linus?
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a

Shiort of that, Nikos: do you happen to have a test scenario that teases
out this deadlock?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

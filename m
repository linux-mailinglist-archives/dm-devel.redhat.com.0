Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EE80FD1388
	for <lists+dm-devel@lfdr.de>; Wed,  9 Oct 2019 18:05:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E7463082E44;
	Wed,  9 Oct 2019 16:05:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45D9910013A1;
	Wed,  9 Oct 2019 16:05:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8312180085A;
	Wed,  9 Oct 2019 16:05:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x99G4nAw012639 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Oct 2019 12:04:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECE5660166; Wed,  9 Oct 2019 16:04:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 686C36012A;
	Wed,  9 Oct 2019 16:04:47 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:04:46 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191009160446.GA2284@redhat.com>
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
	<20191009141308.GA1670@redhat.com>
	<d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, iliastsi@arrikto.com, agk@redhat.com,
	Guruswamy Basavaiah <guru2018@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 09 Oct 2019 16:05:14 +0000 (UTC)

On Wed, Oct 09 2019 at 11:44am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
> > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > 
> >> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
> >>> Hello Nikos,
> >>>  Yes, issue is consistently reproducible with us, in a particular
> >>> set-up and test case.
> >>>  I will get the access to set-up next week, will try to test and let
> >>> you know the results before end of next week.
> >>>
> >>
> >> That sounds great!
> >>
> >> Thanks a lot,
> >> Nikos
> > 
> > Hi Guru,
> > 
> > Any chance you could try this fix that I've staged to send to Linus?
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
> > 
> > Shiort of that, Nikos: do you happen to have a test scenario that teases
> > out this deadlock?
> > 
> 
> Hi Mike,
> 
> Yes,
> 
> I created a 50G LV and took a snapshot of the same size:
> 
>   lvcreate -n data-lv -L50G testvg
>   lvcreate -n snap-lv -L50G -s testvg/data-lv
> 
> Then I ran the following fio job:
> 
> [global]
> randrepeat=1
> ioengine=libaio
> bs=1M
> size=6G
> offset_increment=6G
> numjobs=8
> direct=1
> iodepth=32
> group_reporting
> filename=/dev/testvg/data-lv
> 
> [test]
> rw=write
> timeout=180
> 
> , concurrently with the following script:
> 
> lvcreate -n dummy-lv -L1G testvg
> 
> while true
> do
>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
>  lvremove -f testvg/dummy-snap
> done
> 
> This reproduced the deadlock for me. I also ran 'echo 30 >
> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
> timeout.
> 
> Nikos.

Very nice, well done.  Curious if you've tested with the fix I've staged
(see above)?  If so, does it resolve the deadlock?  If you've had
success I'd be happy to update the tags in the commit header to include
your Tested-by before sending it to Linus.  Also, any review of the
patch that you can do would be appreciated and with your formal
Reviewed-by reply would be welcomed and folded in too.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

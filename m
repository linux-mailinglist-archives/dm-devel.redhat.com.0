Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8409422D599
	for <lists+dm-devel@lfdr.de>; Sat, 25 Jul 2020 08:51:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-SN6Tp7K_NGC773pZqQAAhA-1; Sat, 25 Jul 2020 02:51:37 -0400
X-MC-Unique: SN6Tp7K_NGC773pZqQAAhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79741005504;
	Sat, 25 Jul 2020 06:51:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6935A76210;
	Sat, 25 Jul 2020 06:51:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0DA1809554;
	Sat, 25 Jul 2020 06:51:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06P6p8tH002212 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 25 Jul 2020 02:51:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D041202B16F; Sat, 25 Jul 2020 06:51:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 287CD202B16C
	for <dm-devel@redhat.com>; Sat, 25 Jul 2020 06:51:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E49E4185A797
	for <dm-devel@redhat.com>; Sat, 25 Jul 2020 06:51:04 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-428-hgDSdaH1N46nf9xAFPy9Uw-1;
	Sat, 25 Jul 2020 02:51:01 -0400
X-MC-Unique: hgDSdaH1N46nf9xAFPy9Uw-1
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 15477404A6
	for <dm-devel@redhat.com>; Sat, 25 Jul 2020 09:42:32 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with ESMTP id EE7D6D4
	for <dm-devel@redhat.com>; Sat, 25 Jul 2020 09:42:32 +0300 (MSK)
To: dm-devel@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <4b9db271-503b-c89d-aacb-f0c2f82c9153@msgid.tls.msk.ru>
Date: Sat, 25 Jul 2020 09:42:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: [dm-devel] dm snapshots again: should they work?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

Some time ago I had to use snapshots of a filesystem which was not on LVM,
so I decided to give dmsetup snapshot/snapshot-origin a try.  And discovered
that besides the very specific LVM-like scenario, this thing just does not
work, - it crashes the kernel after a very simple action. Also there's almost
no documentation about this.  Hence my question.

For a test, I made 2 loop devices of two files, loop0 of 1G and loop1 of 100M.
They're not used in any way, just losetup'ed. First to be used as a base image,
second is for snapshot/cow data.

Next I create snapshot-origin device on top of loop0. Documentation _only_
states I should create a linear mapping first and replace it with a snapshot-
origin target while I/O is suspended, and LVM does exactly this, but I
thought - since this device isn't used, I'd create snapshot-origin right
out of it.  Created snapshot-origin /dev/mapper/snaporig device, so far
so good. But now, any (write) access to this device instantly crashes the
kernel with either reboot or hard lockup, depending on the kernel version.

So here come first 2 questions.  Is this usage wrong somehow? As far as
I can see, this is normal usage (besides replacing the table vs creating
new table, and besides not locking I/O), and this is how the whole stack
looks like whithout an actual snapshot.  And if this usage is wrong,
shouldn't kernel forbid it somehow, instead of crashing?

As far as I understand, one snapshot-origin can be used for several
snapshots (again, this isn't exactly clear from the documentation), so
my idea was to create snapshot-origin and mount it mount it first,
so I'll be able to create snapshots later as needed. Is it okay to have
more than one snapshot out of snapshot-origin, or is it always a 1:1 pair,
one snapshot-origin and one snapshot? If it's the latter, again, maybe
kernel should refuse to have snapshot-origin without snapshot with
non-suspended I/O -- eg, when creating snapshot-origin we can have
I/O suspended initially, and refuse to resume it without exactly one
snapshot.

On the other hand, it seems I can remove snapshot table (after creating
and playing with it), and _mounted_ snapshot-origin device continues
to operate normally without kernel crashing. This is exactly the same
stack as I initially created, the only difference is the way it was
created - first time (when it crashes) I created only snapshot-origin
and mounted it, the second time I created both snapshot-origin and
snapshot on top of it, and removed snapshot later, leaving
snapshot-origin only. This works, or at least appears to work -
again, from the documentation it is unclear whenever this is
supposed to work or not.

Another question is about the usage of the original device being
snapshotted. In almost all examples it is another DM device,
and it is used for _both_ the snapshot and snapshot-origin.
For me as a end-user, a more logical would be to have the
original device as a base for snapshot-origin (which includes
the CoW functionality), and this snapshot-origin device being
a base for snapshot(s), - snapshots which receive the CoW data.
But it seems both snapshot-origin _and_ snapshot have the
original device as a base, - it is not exactly clear how the
two communicate with each other this way.  Can snapshot be
made out of snapshot-origin, or will kernel crash there too?

I haven't tested all other possible variants and scenarios, thought
I'd ask first how this whole thing is _supposed_ to work.

A very useful information about this stuff is found on this 2004 email:
https://www.redhat.com/archives/dm-devel/2004-July/msg00071.html

This and a few other, very scarce, references exists, but it is
difficult to get whole picture.. and it definitely is not clear
at all why kernel crashes. To me, dmsetup is a basic command like
ls or cp, - and running either of them with wrong argument (even
if it is not clear _why_ it's wrong) should not result in the
system crashing. Whole thing looks very fragile and untested,
after these experiments (in a virtual machine so I wont need to
reboot larger box 100 times a hour) I now have a conditioned
reflex - I expect the system crash on me after hitting <Enter>
on the next dmsetup command, so it is always a heart-breaking
thing to actually hit the damn Enter :)	

And BTW, I actually completed the origina task I had with
snapshots, but it took me quite some time and amount of
crashes/reboots to find the proper sequence of the commands,
and to replicate this sequence on a production system. It
worked flawlessly, but I knew that any step aside of this
is a sure way to lock up the system.

Thanks,

/mjt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


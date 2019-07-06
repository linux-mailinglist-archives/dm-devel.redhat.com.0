Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890661396
	for <lists+dm-devel@lfdr.de>; Sun,  7 Jul 2019 05:39:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD47C5D688;
	Sun,  7 Jul 2019 03:39:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8991B19C77;
	Sun,  7 Jul 2019 03:39:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60F7B18184AD;
	Sun,  7 Jul 2019 03:39:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x661Dutk003322 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 21:13:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F01138681C; Sat,  6 Jul 2019 01:13:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF5F86812
	for <dm-devel@redhat.com>; Sat,  6 Jul 2019 01:13:53 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	by mx1.redhat.com (Postfix) with ESMTP id 1190E81F13
	for <dm-devel@redhat.com>; Sat,  6 Jul 2019 01:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 95161A0692;
	Sat,  6 Jul 2019 01:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AzyfvBEis_0O; Sat,  6 Jul 2019 01:07:18 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 8BB22A067D;
	Sat,  6 Jul 2019 01:07:18 +0000 (UTC)
Date: Sat, 6 Jul 2019 01:07:15 +0000 (UTC)
From: Eric Wheeler <bcache@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Don Doerner <Don.Doerner@Quantum.Com>
In-Reply-To: <BYAPR14MB277641CB1C17C53346C8FDD5FCF90@BYAPR14MB2776.namprd14.prod.outlook.com>
Message-ID: <alpine.LRH.2.11.1907060102450.12361@mx.ewheeler.net>
References: <BYAPR14MB27766E20D92C2A07217C2DF9FCFC0@BYAPR14MB2776.namprd14.prod.outlook.com>
	<d06e4a83-c314-46b7-72ea-97e455acd69f@suse.de>
	<BYAPR14MB277641CB1C17C53346C8FDD5FCF90@BYAPR14MB2776.namprd14.prod.outlook.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1690155773-992976465-1562375051=:12361"
X-Greylist: Delayed for 00:06:31 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Sat, 06 Jul 2019 01:13:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Sat, 06 Jul 2019 01:13:52 +0000 (UTC) for IP:'66.155.3.69'
	DOMAIN:'mx.ewheeler.net' HELO:'mx.ewheeler.net'
	FROM:'bcache@lists.ewheeler.net' RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 66.155.3.69 mx.ewheeler.net 66.155.3.69
	mx.ewheeler.net <bcache@lists.ewheeler.net>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sat, 06 Jul 2019 23:39:13 -0400
Cc: "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	dm-devel@redhat.com, Coly Li <colyli@suse.de>
Subject: Re: [dm-devel] I/O Reordering: Cache -> Backing Device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sun, 07 Jul 2019 03:39:54 +0000 (UTC)

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1690155773-992976465-1562375051=:12361
Content-Type: TEXT/PLAIN; CHARSET=ISO-2022-JP

[+cc dm-devel]

> -----Original Message-----
> From: linux-bcache-owner@vger.kernel.org <linux-bcache-owner@vger.kernel.org> On Behalf Of Coly Li
> Sent: Sunday, 30 June, 2019 19:24
> To: Don Doerner <Don.Doerner@Quantum.Com>
> Cc: linux-bcache@vger.kernel.org
> Subject: Re: I/O Reordering: Cache -> Backing Device
> 
> On 2019/6/29 5:56 上午, Don Doerner wrote:
> > Hello, I'm also interested in using bcache to facilitate stripe 
> > re-ass'y for the backing device.  I've done some experiments that 
> > dovetail with some of the traffic on this mailing list.  
> > Specifically, in this message 
> > (https://nam05.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Flinux-bcache%2Fmsg07590.html&amp;data=02%7C01%7CDon.Doerner%40quantum.com%7Cafa50dd04a914f76bb7808d6fdcb338b%7C322a135f14fb4d72aede122272134ae0%7C1%7C0%7C636975446529502069&amp;sdata=nC3JhPL%2FC6B57uw4xjEkGnV48jd9DqHLf0MQL7AAErs%3D&amp;reserved=0), 
> > Eric suggested "...turning up 
> > /sys/block/bcache0/bcache/writeback_percent..." to increase the 
> > contiguous data in the cache.
> > My RAID-6 has a stripe size of 2.5MiB, and its bcache'ed with a few 
> > hundred GB of NVMe storage.  Here's my experiment:
> > * I made the cache a write back cache: echo writeback >
> > /sys/block/bcache0/bcache/cache_mode
> > * I plugged the cache: echo 0 >
> > /sys/block/bcache0/bcache/writeback_running
> > * I use a pathological I/O pattern, generated with 'fio': fio 
> >   --bs=128K --direct=1 --rw=randwrite --ioengine=libaio --iodepth=1 
> >   --numjobs=1 --size=40G --name=/dev/bcache0.  I let it run to 
> >   completion, at which point I believe I should have 40 GiB of 
> >   sequential dirty data in cache, but not put there sequentially.  In 
> >   essence, I should have ~16K complete stripes sitting in the cache, 
> >   waiting to be written.
> > * I set stuff up to go like a bat: echo 0 >
> > /sys/block/bcache0/bcache/writeback_percent; echo 0 >
> > /sys/block/bcache0/bcache/writeback_delay; echo 2097152 >
> > /sys/block/bcache0/bcache/writeback_rate
> > * And I unplugged the cache: echo 1 >
> > /sys/block/bcache0/bcache/writeback_running
> > I then watched 'iostat', and saw that there were lots of read operations (statistically, after merging, about 1 read for every 7 writes) - more than I had expected... that's enough that I concluded it wasn't building full stripes.  It kinda looks like it's playing back a journal sorted in time then LBA, or something like that...
> > Any suggestions for improving (reducing) the ratio of reads to writes will be gratefully accepted!
> 
> Hi Don,
> 
> If the backing device has expensive stripe cost, the upper layer should 
> issue I/Os with stripe size alignment, otherwise bcache cannot to too 
> much to make the I/O to be stripe optimized.
> 
> And you are right that bcache does not writeback in restrict LBA order, 
> this is because the internal btree is trend to be appended only. The LBA 
> ordering writeback happens in a reasonable small range, not in whole 
> cached data, see commit 6e6ccc67b9c7 ("bcache: writeback: properly order 
> backing device IO").
> 
> And I agree with you again that "improving (reducing) the ratio of reads 
> to writes will be gratefully accepted". Indeed not only reducing reads 
> to writes ratio, but also increase the reads to writes throughput. This 
> is something I want to improve, after I understand why the problem 
> exists in bcache writeback code ...


dm-devel list:

Does dm-writecache do any attempt to merge IOs into the io_opt size?

If so, bcache might get some ideas by looking at that codebase for its 
writeback thread.

--
Eric Wheeler


> 
> Thanks.
> 
> --
> 
> Coly Li
> The information contained in this transmission may be confidential. Any disclosure, copying, or further distribution of confidential information is not permitted unless such privilege is explicitly granted in writing by Quantum. Quantum reserves the right to have electronic communications, including email and attachments, sent across its networks filtered through security software programs and retain such messages in order to comply with applicable data security and retention requirements. Quantum is not responsible for the proper and complete transmission of the substance of this communication or for any delay in its receipt.
> 
---1690155773-992976465-1562375051=:12361
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
---1690155773-992976465-1562375051=:12361--


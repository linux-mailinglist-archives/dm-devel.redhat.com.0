Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCFE6062CC
	for <lists+dm-devel@lfdr.de>; Thu, 20 Oct 2022 16:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666275518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uyceqk0H21iXTqLzqKEmNXjkZgQWg2IhebQ36+0VYmU=;
	b=OHemaIx/6vvjRvksTWdFecwfwNkHqLR1quc+sHg7XC+pCuzsljOPYwBPWx/j7/Btve0xXI
	lexXpu/kDeTTJU6U5gL6pfUJpymMEFv4HKYNuODOztDVrabM5OUHrA60ee3OnCTeT6UsNc
	ktadeA425V6WsI8SFco6LVyyVGdAfVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-ZZBIMb8QNJmENr4_yCz7uQ-1; Thu, 20 Oct 2022 10:18:35 -0400
X-MC-Unique: ZZBIMb8QNJmENr4_yCz7uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02E4329ABA07;
	Thu, 20 Oct 2022 14:18:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4E092166B33;
	Thu, 20 Oct 2022 14:18:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B095319465B1;
	Thu, 20 Oct 2022 14:18:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 404201946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 20 Oct 2022 14:18:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F2431121315; Thu, 20 Oct 2022 14:18:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 170FA10DCF50
 for <dm-devel@redhat.com>; Thu, 20 Oct 2022 14:18:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B4F82A59563
 for <dm-devel@redhat.com>; Thu, 20 Oct 2022 14:18:21 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-ixOzDv3lOBCb7Cm3ngUpBw-1; Thu, 20 Oct 2022 10:18:14 -0400
X-MC-Unique: ixOzDv3lOBCb7Cm3ngUpBw-1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRWlGSWpSXmKPExsViZ8ORpDstIjD
 Z4PVZLYt3n6ssthy7x2hx+Qmfxd53s1ktTk9YxGRx9tdVFos9e0+yWFzeNYfNYtefHewWK3/8
 YbV4uGAzu8Xa/nQHHo9TiyQ8du1qZPfYvELLY9OqTjaPF5tnMnq833eVzePzJrkA9ijWzLyk/
 IoE1oztXy+xF7TbVvw7c4epgfGnfhcjF4eQwEZGif4T/WwQzhImiW+zprJDONsYJdZuu8raxc
 jJwStgJzG7+y8biM0ioCrRu+IZG0RcUOLkzCcsILaoQJLE1Q13weqFBXwl1m7qYwaxRQRKJWZ
 +bWcGGcosMItFYv25OewgCSGBF8wSb69ogdhsAo4S82ZtBBvKKaAhcWbaXbAaZgELicVvDkLZ
 8hLb384BGyohoCjRtuQfO4RdITFrVhsThK0mcfXcJuYJjEKzkNw3C8moWUhGLWBkXsVoVpxaV
 JZapGtoopdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGI
 8pxWyrdjD+WvZH7xCjJAeTkiivsGpgshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3sAwoJxgUWp
 6akVaZg4wNcCkJTh4lER4xUKB0rzFBYm5xZnpEKlTjJYc53fu38vMsbbhAJD8+OfiXmYhlrz8
 vFQpcd5ikHkCIA0ZpXlw42Dp6xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd6zIGt5MvNK4
 La+AjqICegg0y1+IAeVJCKkpBqYeiUnuc77Ki0quEfi8ZQHJ/4VTOPgrtnw/+f9hpXql/+f4U
 s9bb2pf8NNLs09R0WXpSRNfZv+M/Ol/tTXlkGC3Te6N15+mVyXyCcw9+Wn3Qnbel05fKrPvV5
 X5s3k9b291rfqlDl/VNmC5+v3Li5Q+5ay4PXNo3qb9NM1ijKvN601yLgW4NFvw+ypVX7o3c20
 i9mHn/z3iyzbNHfyC5tnUvxKU3wfmrsEVNg8i7ukHLmvcueZ2ZyxV9oyr59SVmCu/OnJ2mS+J
 cODwfTthv2vs9RzbWN7ky6ekJqwqntWzfcd4TnJzbPMla4vmTB3lXRHB8urta/l7KYpc9z/OW
 F106r/L63nnItdu9yXyT6MWYmlOCPRUIu5qDgRACDUWMDaAwAA
X-Env-Sender: yangx.jy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1666275478!137699!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18512 invoked from network); 20 Oct 2022 14:17:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
 by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Oct 2022 14:17:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2A4EF1B1;
 Thu, 20 Oct 2022 15:17:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1E2271AB;
 Thu, 20 Oct 2022 15:17:58 +0100 (BST)
Received: from [10.167.215.54] (10.167.215.54) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 20 Oct 2022 15:17:53 +0100
Message-ID: <6a83a56e-addc-f3c4-2357-9589a49bf582@fujitsu.com>
Date: Thu, 20 Oct 2022 22:17:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: "Darrick J. Wong" <djwong@kernel.org>,
 =?UTF-8?B?R290b3UsIFlhc3Vub3JpL+S6lOWztiDlurfmloc=?= <y-goto@fujitsu.com>
References: <7fdc9e88-f255-6edb-7964-a5a82e9b1292@fujitsu.com>
 <76ea04b4-bad7-8cb3-d2c6-4ad49def4e05@fujitsu.com> <YyHKUhOgHdTKPQXL@bfoster>
 <YyIBMJzmbZsUBHpy@magnolia>
 <a6e7f4eb-0664-bbe8-98d2-f8386b226113@fujitsu.com>
 <e3d51a6b-12e9-2a19-1280-5fd9dd64117c@fujitsu.com>
 <deb54a77-90d3-df44-1880-61cce6e3f670@fujitsu.com>
 <1444b9b5-363a-163c-0513-55d1ea951799@fujitsu.com>
 <Yzt6eWLuX/RTjmjj@magnolia>
 <f196bcab-6aa2-6313-8a7c-f8ab409621b7@fujitsu.com>
 <Yzx64zGt2kTiDYaP@magnolia>
From: =?UTF-8?B?WWFuZywgWGlhby/mnagg5pmT?= <yangx.jy@fujitsu.com>
In-Reply-To: <Yzx64zGt2kTiDYaP@magnolia>
X-Originating-IP: [10.167.215.54]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH] xfs: fail dax mount if reflink is enabled on
 a partition
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, toshi.kani@hpe.com,
 dm-devel@redhat.com, "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 Brian Foster <bfoster@redhat.com>, "david@fromorbit.com" <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?UnVhbiwgU2hpeWFuZy/pmK4g5LiW6Ziz?= <ruansy.fnst@fujitsu.com>,
 "hch@infradead.org" <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
 zwisler@kernel.org,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2022/10/5 2:26, Darrick J. Wong wrote:
> Notice this line in generic/470:
> 
> $XFS_IO_PROG -t -c "truncate $LEN" -c "mmap -S 0 $LEN" -c "mwrite 0 $LEN" \
> 	-c "log_writes -d $LOGWRITES_NAME -m preunmap" \
> 	-f $SCRATCH_MNT/test
> 
> The second xfs_io command creates a MAP_SYNC mmap of the
> SCRATCH_MNT/test file, and the third command memcpy's bytes to the
> mapping to invoke the write page fault handler.
> 
> The fourth command tells the dm-logwrites driver for $LOGWRITES_NAME
> (aka the block device containing the mounted XFS filesystem) to create a
> mark called "preunmap".  This mark captures the exact state of the block
> device immediately after the write faults complete, so that we can come
> back to it later.  There are a few things to note here:
> 
>    (1) We did not tell the fs to persist anything;
>    (2) We can't use dm-snapshot here, because dm-snapshot will flush the
>        fs (I think?); and
>    (3) The fs is still mounted, so the state of the block device at the
>        mark reflects a dirty XFS with a log that must be replayed.
> 
> The next thing the test does is unmount the fs, remove the dm-logwrites
> driver to stop recording, and check the fs:
> 
> _log_writes_unmount
> _log_writes_remove
> _dmthin_check_fs
> 
> This ensures that the post-umount fs is consistent.  Now we want to roll
> back to the place we marked to see if the mwrite data made it to pmem.
> It*should*  have, since we asked for a MAP_SYNC mapping on a fsdax
> filesystem recorded on a pmem device:
> 
> # check pre-unmap state
> _log_writes_replay_log preunmap $DMTHIN_VOL_DEV
> _dmthin_mount
> 
> dm-logwrites can't actually roll backwards in time to a mark, since it
> only records new disk contents.  It/can/  however roll forward from
> whatever point it began recording writes to the mark, so that's what it
> does.
> 
> However -- remember note (3) from earlier.  When we _dmthin_mount after
> replaying the log to the "preunmap" mark, XFS will see the dirty XFS log
> and try to recover the XFS log.  This is where the replay problems crop
> up.  The XFS log records a monotonically increasing sequence number
> (LSN) with every log update, and when updates are written into the
> filesystem, that LSN is also written into the filesystem block.  Log
> recovery also replays updates into the filesystem, but with the added
> behavior that it skips a block replay if the block's LSN is higher than
> the transaction being replayed.  IOWs, we never replay older block
> contents over newer block contents.
> 
> For dm-logwrites this is a major problem, because there could be more
> filesystem updates written to the XFS log after the mark is made.  LSNs
> will then be handed out like this:
> 
> mkfs_lsn                 preunmap_lsn             umount_lsn
>    |                           |                      |
>    |--------------------------||----------|-----------|
>                               |           |
>                           xxx_lsn     yyy_lsn
> 
> Let's say that a new metadata block "BBB" was created in update "xxx"
> immediately before the preunmap mark was made.  Per (1), we didn't flush
> the filesystem before taking the mark, which means that the new block's
> contents exist only in the log at this point.
> 
> Let us further say that the new block was again changed in update "yyy",
> where preunmap_lsn < yyy_lsn <= umount_lsn.  Clearly, yyy_lsn > xxx_lsn.
> yyy_lsn is written to the block at unmount, because unmounting flushes
> the log clean before it completes.  This is the first time that BBB ever
> gets written.
> 
> _log_writes_replay_log begins replaying the block device from mkfs_lsn
> towards preunmap_lsn.  When it's done, it will have a log that reflects
> all the changes up to preunmap_lsn.  Recall however that BBB isn't
> written until after the preunmap mark, which means that dm-logwrites has
> no record of BBB before preunmap_lsn, so dm-logwrites replay won't touch
> BBB.  At this point, the block header for BBB has a UUID that matches
> the filesystem, but a LSN (yyy_lsn) that is beyond preunmap_lsn.
> 
> XFS log recovery starts up, and finds transaction xxx.  It will read BBB
> from disk, but then it will see that it has an LSN of yyy_lsn.  This is
> larger than xxx_lsn, so it concludes that BBB is newer than the log and
> moves on to the next log item.  No other log items touch BBB, so
> recovery finishes, and now we have a filesystem containing one metadata
> block (BBB) from the future.  This is an inconsistent filesystem, and
> has caused failures in the tests that use logwrites.
> 
> To work around this problem, all we really need to do is reinitialize
> the entire block device to known contents at mkfs time.  This can be
> done expensively by writing zeroes to the entire block device, or it can
> be done cheaply by (a) issuing DISCARD to the whole the block device at
> the start of the test and (b) ensuring that reads after a discard always
> produce zeroes.  mkfs.xfs already does (a), so the test merely has to
> ensure (b).
> 
> dm-thinp is the only software solution that provides (b), so that's why
> this test layers dm-logwrites on top of dm-thinp on top of $SCRATCH_DEV.
> This combination used to work, but with the pending pmem/blockdev
> divorce, this strategy is no longer feasible.

Hi Darrick,

Thanks a lot for your detailed explanation.

Could you tell me if my understanding is correct. I think the issue is 
that log-writes log and XFS log may save the different state of block 
device. It is possible for XFS log to save the more updates than 
log-writes log does. In this case, we can recovery the block device by 
log-writes log's replay but we will get the inconsistent filesystem when 
mounting the block device because the mount operation will try to 
recovery more updates for XFS on the block deivce by XFS log. We need to 
fix the issue by discarding XFS log on the block device.  mkfs.xfs will 
try to discard the blocks including XFS log by calling ioctl(BLKDISCARD) 
  but it will ignore error silently when the block device doesn't 
support ioctl(BLKDISCARD).  Discarding XFS log is what you said 
"reinitialize the entire block device", right?

> 
> I think the only way to fix this test is (a) revert all of Christoph's
> changes so far and scuttle the divorce; or (b) change this test like so:

Sorry, I didn't know which Christoph's patches need to be reverted?
Could you tell me the URL about Christoph's patches?

> 
>   1. Create a large sparse file on $TEST_DIR and losetup that sparse
>      file.  The resulting loop device will not have dax capability.
> 
>   2. Set up the dmthin/dmlogwrites stack on top of this loop device.
> 
>   3. Call mkfs.xfs with the SCRATCH_DEV (which hopefully is a pmem
>      device) as the realtime device, and set the daxinherit and rtinherit
>      flags on the root directory.  The result is a filesystem with a data
>      section that the kernel will treat as a regular block device, a
>      realtime section backed by pmem, and the necessary flags to make
>      sure that the test file will actually get fsdax mode.
> 
>   4. Acknowledge that we no longer have any way to test MAP_SYNC
>      functionality on ext4, which means that generic/470 has to move to
>      tests/xfs/.

Sorry, I didn't understand why the above test change can fix the issue.
Could you tell me which step can discard XFS log?

In addition, I don't like your idea about the test change because it 
will make generic/470 become the special test for XFS. Do you know if we 
can fix the issue by changing the test in another way? blkdiscard -z can 
fix the issue because it does zero-fill rather than discard on the block 
device.  However, blkdiscard -z will take a lot of time when the block 
device is large.

Best Regards,
Xiao Yang

> 
> --D

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


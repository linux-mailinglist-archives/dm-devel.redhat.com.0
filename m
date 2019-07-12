Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE0667543
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 21:06:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46456C00296D;
	Fri, 12 Jul 2019 19:06:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5F060A9A;
	Fri, 12 Jul 2019 19:06:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 438D441F53;
	Fri, 12 Jul 2019 19:06:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CJ5wcF017845 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 15:05:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0A2360A9A; Fri, 12 Jul 2019 19:05:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 419A3608AB;
	Fri, 12 Jul 2019 19:05:56 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F33E308FC4E;
	Fri, 12 Jul 2019 19:05:55 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id d15so7214419qkl.4;
	Fri, 12 Jul 2019 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=A89k2QBX+ifN58xgjSwKur5/GOghr6/HQzXuEW38IeY=;
	b=WMmXcaAbw0c9pMcJCZ5CyKXUgVpjIWFrRZlIT69RmqKeLaYdWm2K2zzFUKEbjI5Hbb
	9CCLaLAL9t5HM9+bMGD3QDqtK+HmDkcqd55Mro02OPRskkglZTXs29LesSgD9vUu05kd
	m76otCp6CpvYXj2Re/333SmIpTRI/NBd0ybX36dY7/j/hodaUEZB6U8k5Cb9Y9alVU5g
	Fbxoh4or9T3w1a5GO2ftVIlnzu/b2WGlYB9RBQ2FPBt13uP3o44EMfm8zsTMuuhaxq67
	4djI+c0QY1BUHGElN6GaMNZBG18j+5wzBcimSXoWHaSC8GhEO1rloiTh967PB6i2bjOK
	7E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=A89k2QBX+ifN58xgjSwKur5/GOghr6/HQzXuEW38IeY=;
	b=WFYK5Bdr6hm9aEmQOrVnNhJcSFzyh45gL0wFHjQEkPxk2a8L0BtXIXdOuLHVfmTddy
	Fv4+w44TuD3UIAtIGFt4T3fzAwEO8d7+Py0RDrF6BkjzMYLeIF5DOvak+UaVYUXEwYvK
	6awNtr+tybylSFbIMjuTh1U4KBK675X/edAoMHgW5kv3HWhv9uwkU4qm0l7NFFXyDRbs
	YhRRH6xYfn6iypz93yncdFuMRsEep2LapWgoNiPvKVsvKCWPMKXUbvjnXahV7T1Rr0fG
	n2cl0mBdp8JBl2VSxWThaHscxN6JpfsjRwjF3gLPHd7Z9HrITPhO+lXpl89NJAfIQ0f+
	xllg==
X-Gm-Message-State: APjAAAXOsg4bV6Fzax6GBNMgcNFbHRING8gvNOdFO5IE7bQm8Yaji28e
	ezk3WAndKKr/i6hxq8K/cV0=
X-Google-Smtp-Source: APXvYqw0ikm+ZPVkqqJSWm0o5jlXH6CI1HTOadroID2Cd1BEylNFjwFq4YIDc57jJXeZD46xHd5aCQ==
X-Received: by 2002:a37:ad0f:: with SMTP id f15mr7467328qkm.68.1562958354379; 
	Fri, 12 Jul 2019 12:05:54 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id t8sm3904990qkt.75.2019.07.12.12.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jul 2019 12:05:53 -0700 (PDT)
Date: Fri, 12 Jul 2019 15:05:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190712190552.GA52544@lobo>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 12 Jul 2019 19:05:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 12 Jul 2019 19:05:55 +0000 (UTC) for IP:'209.85.222.173'
	DOMAIN:'mail-qk1-f173.google.com'
	HELO:'mail-qk1-f173.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.793 * (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.173 mail-qk1-f173.google.com 209.85.222.173
	mail-qk1-f173.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Zhengyuan Liu <liuzhengyuan@kylinos.cn>,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Qu Wenruo <wqu@suse.com>,
	Fuqian Huang <huangfq.daxian@gmail.com>, Milan Broz <gmazyland@gmail.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper changes for 5.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 12 Jul 2019 19:06:26 +0000 (UTC)

Hi Linus,

Merging these DM changes will require manual conflict resolution in the
snapshot target's Documentation updates due to conflicts with the
shotgun blast of RST changes to DM documentation that I didn't ack but
got in anyway -- clearly the RST Documentation train brakes for nobody ;)
Feel free to have a look at the test merge I did in the linux-dm.git
'dm-5.3-merge' branch.

Also, you'll note that the last 2 commits of this pull were rebased
today; I did that because the dm-bufio fix's commit header needed a lot
of grammar fixes and was also missing the stable@vger.kernel.org Cc.

The following changes since commit 2eba4e640b2c4161e31ae20090a53ee02a518657:

  dm verity: use message limit for data block corruption message (2019-06-25 14:09:14 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.3/dm-changes

for you to fetch changes up to bd293d071ffe65e645b4d8104f9d8fe15ea13862:

  dm bufio: fix deadlock with loop device (2019-07-12 09:59:37 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Add encrypted byte-offset initialization vector (eboiv) to DM crypt.

- Add optional discard features to DM snapshot which allow freeing space
  from a DM device whose free space was exhausted.

- Various small improvements to use struct_size() and kzalloc().

- Fix to check if DM thin metadata is in fail_io mode before attempting
  to update the superblock to set the needs_check flag.  Otherwise the
  DM thin-pool can hang.

- Fix DM bufio shrinker's potential for ABBA recursion deadlock with DM
  thin provisioning on loop usecase.

----------------------------------------------------------------
Fuqian Huang (1):
      dm integrity: use kzalloc() instead of kmalloc() + memset()

Junxiao Bi (1):
      dm bufio: fix deadlock with loop device

Mike Snitzer (2):
      dm thin metadata: check if in fail_io mode when setting needs_check
      dm snapshot: add optional discard support features

Milan Broz (4):
      dm integrity: always set version on superblock update
      dm crypt: wipe private IV struct after key invalid flag is set
      dm crypt: remove obsolete comment about plumb IV
      dm crypt: implement eboiv - encrypted byte-offset initialization vector

Pavel Begunkov (1):
      dm: update stale comment in end_clone_bio()

Qu Wenruo (1):
      dm log writes: fix incorrect comment about the logged sequence example

Zhengyuan Liu (2):
      dm crypt: use struct_size() when allocating encryption context
      dm log writes: use struct_size() to calculate size of pending_block

 Documentation/device-mapper/snapshot.txt |  16 +++
 drivers/md/dm-bufio.c                    |   4 +-
 drivers/md/dm-crypt.c                    | 101 +++++++++++++++--
 drivers/md/dm-integrity.c                |   7 +-
 drivers/md/dm-log-writes.c               |   4 +-
 drivers/md/dm-rq.c                       |   2 +-
 drivers/md/dm-snap.c                     | 186 +++++++++++++++++++++++++++----
 drivers/md/dm-thin-metadata.c            |   7 +-
 8 files changed, 284 insertions(+), 43 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

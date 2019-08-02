Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E92EC7FD71
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 17:24:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 479413091D55;
	Fri,  2 Aug 2019 15:23:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70EA05D9D3;
	Fri,  2 Aug 2019 15:23:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CBCC18089C8;
	Fri,  2 Aug 2019 15:23:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72FIUEh015717 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 11:18:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BAE5160605; Fri,  2 Aug 2019 15:18:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF76608C2;
	Fri,  2 Aug 2019 15:18:28 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD8BA8830A;
	Fri,  2 Aug 2019 15:18:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k10so5092929qtq.1;
	Fri, 02 Aug 2019 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=gdngyBtdu0hdLvbeSbTye0hHvs2AeGgWPnp7xtpz2pc=;
	b=bmOflGozxI+mphcODY5j7b5BFsfrSWy3IStln5jlsCHG22r0XXLXiVYhg3h+Q/ybO/
	EEZE/oPaI7sHjS1wktwJ7ClVppB8cnwh5yjkEgbM7nx4Tss6EGDyAUiETkxpD24cXwhO
	++aTWhjhQ2cm+8LD+9pI4hHmL7z1WiWgKx2BwffkRRaxPCp1CJ9jKL/SLccBSMNpkrmJ
	PV4lk3QGGl5ZgxYVCTNPHqwUWKWuDpVaECx+Q2O49rPl9BBJ4p1RstF0aS7KLYMOfqub
	dueOfDsMkLu/3D2IUF3/EAG1V3hEEJaBNA0/bBbfnTeoBEeJUaB2cMV0aNdih6iqBLSh
	1UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=gdngyBtdu0hdLvbeSbTye0hHvs2AeGgWPnp7xtpz2pc=;
	b=kZJf3fRrrGSWUtzXqVE6GOrfHNq/ZvZzVUpvOMQXLWA8FXoOSyDGKt0Qngts81EHdX
	mOzTi+C4AEJ5J4SDlzU3Rk+6vPeCIvewR7sBCJD6eov9w+TtonFCElOnqqFTIJddVL9M
	onLijSgUnzwEmoSIGkRmOYcNbMVC+oXSsSWFomPjKdbpnFJxdQWecbsxM+ZD1pvc34GG
	bL8+a6mKLg0RhpeEwFL352TtBGF2mbSA8DQqOitey8CnguReQmBDcspm9YpuK7JD5HuY
	X9WXxWsT0ELTWRYhaov/e933yOkmhWpR3gma8szFEhTHWm7icogwSX9qNUVYOXJ0+wh2
	81iQ==
X-Gm-Message-State: APjAAAUYlUllGssUZWLlhuKyJK/9vK8lHtWKGzlipE9d/VBCvwknljoI
	vTmnQLCT0krjpbOIxiQ6PvQ=
X-Google-Smtp-Source: APXvYqzwf8ISub3zZQgY3MRTVRb9eZqoBIKiw7mfLgYH6rV1oSYEitDAJeImj/PmBE8fAIg+AtfRmg==
X-Received: by 2002:ac8:2d56:: with SMTP id o22mr93765389qta.171.1564759106857;
	Fri, 02 Aug 2019 08:18:26 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	z33sm33924524qtc.56.2019.08.02.08.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Aug 2019 08:18:26 -0700 (PDT)
Date: Fri, 2 Aug 2019 11:18:25 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190802151824.GA86075@lobo>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 02 Aug 2019 15:18:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 02 Aug 2019 15:18:27 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.236  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Pankaj Gupta <pagupta@redhat.com>,
	dm-devel@redhat.com, Dan Williams <dan.j.williams@intel.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.3-rc3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 02 Aug 2019 15:24:00 +0000 (UTC)

Hi Linus,

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.3/dm-fixes-1

for you to fetch changes up to 9c50a98f55f4b123227eebb25009524d20bc4c2a:

  dm table: fix various whitespace issues with recent DAX code (2019-07-30 18:59:24 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
Fix NULL pointer and various whitespace issues with DM's recent DAX code
changes from commit in 5.3 merge.

----------------------------------------------------------------
Mike Snitzer (1):
      dm table: fix various whitespace issues with recent DAX code

Pankaj Gupta (1):
      dm table: fix dax_dev NULL dereference in device_synchronous()

 drivers/md/dm-table.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0736D60A
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 22:53:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DA7F81F0F;
	Thu, 18 Jul 2019 20:53:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 456F319D7A;
	Thu, 18 Jul 2019 20:53:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 206531800206;
	Thu, 18 Jul 2019 20:53:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IKrEvR020444 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 16:53:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E71E5C238; Thu, 18 Jul 2019 20:53:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C08785C220;
	Thu, 18 Jul 2019 20:53:11 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDF6CA3B66;
	Thu, 18 Jul 2019 20:53:10 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a27so21618610qkk.5;
	Thu, 18 Jul 2019 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=sTtEMGmTL9dvBOIINcDJDROlyszLu+f4o1mt2HA89Y8=;
	b=Q4BvHllCoPJSweP+7DCcl34sOCk6W/PGwv42xJI4uBfiDxUSkOSihSNDqnXNNxqUZy
	qMFTZyiQgNtbewc2ZlAo2oki80fXQRy5h1IMblhZmD0G9TLmEILLgTjMYWJHBzQcKowm
	mRxgbc1B1KFUyhk7SLAsMXdEFV9XSNvn8qjtx26sumDgRTD2ImoAqV1zTc3XUvbCUwNo
	Jm4EAb+Zds++P9SMTFNp0BvIbgglXGg8+sFVhZqbnaoWgJwFyewIuJIX1QxIhKfcu4Bj
	NVtbNMnD5mn8hRDAheGSdE+SaEkJX7aGtGvzaRPOVJWBr5VJBXm9lK7/6RbzmM1D+wT0
	5ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=sTtEMGmTL9dvBOIINcDJDROlyszLu+f4o1mt2HA89Y8=;
	b=tlwGj4KfWZKt4kktY/0QdWc7Avq0Jx0KmddzFbJurHr2aPMKpzPirXL7jhj4M9sQ1c
	XKxeiWkaynmPuG7y6eP0rtGdMjmzQ6jAixcPjrXJaUpmk+h32Iefq8OZPF0GLex36cVF
	qiJLrU4QViFQ3TfafeiV8lte7JPcopYotHKLuHkpKFLGWPVpwhkvrl+x1cchEDllFVs6
	BX190KVDCMX2K0YNi4dZeXbNqAswyufbkwdKz3uR6e4iFkZ7Bprb2NhwHUaNPO8RpzxJ
	lSvfK1QMyDbo/lTZzzvJGYnfAlE3DAjjyDIhU4BfXkYdussDdKl+cEK7n40le01yqRDn
	WkCQ==
X-Gm-Message-State: APjAAAUBAlubd4HCQ7nQEImojCB5RUNtXthHYU8Sg1sVJ4G01y9R7+hQ
	Gl9C6rUTkLs3Eh8dWC8bLzoEgTwm9Xc=
X-Google-Smtp-Source: APXvYqzL460vzQs3RYhC2KbahYwOAjAf8YqVKcN/lSlunc8G7XzMbiLmiXegKwBO4GPMY5NSUQJojw==
X-Received: by 2002:ae9:f016:: with SMTP id l22mr32580980qkg.51.1563483190040; 
	Thu, 18 Jul 2019 13:53:10 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	a135sm13148396qkg.72.2019.07.18.13.53.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 13:53:09 -0700 (PDT)
Date: Thu, 18 Jul 2019 16:53:08 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190718205308.GA65274@lobo>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Jul 2019 20:53:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 18 Jul 2019 20:53:11 +0000 (UTC) for IP:'209.85.222.194'
	DOMAIN:'mail-qk1-f194.google.com'
	HELO:'mail-qk1-f194.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.251  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.194 mail-qk1-f194.google.com 209.85.222.194
	mail-qk1-f194.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Damien Le Moal <damien.lemoal@wdc.com>, Alasdair G Kergon <agk@redhat.com>,
	Nikos Tsironis <ntsironis@arrikto.com>
Subject: [dm-devel] [git pull] additional device mapper changes for 5.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 18 Jul 2019 20:53:41 +0000 (UTC)

Hi Linus,

When I sent my pull last Friday I had overlooked some email that Nikos
(cc'd) sent that same morning concerning review of my dm-snapshot
discard changes that were merged over the weekend.  In addition, Nikos
inquired about his dm-kcopyd subjob size default adjustment I had
requested some changes on.  I've since dealt with those 2 issues and
staged 2 other small fixes (to dm-zoned and DM core's printk wrappers).

The following changes since commit bd293d071ffe65e645b4d8104f9d8fe15ea13862:

  dm bufio: fix deadlock with loop device (2019-07-12 09:59:37 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.3/dm-changes-2

for you to fetch changes up to 733232f8c852bcc2ad6fc1db7f4c43eb01c7c217:

  dm: use printk ratelimiting functions (2019-07-17 13:09:32 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix zone state management race in DM zoned target by eliminating
  the unnecessary DMZ_ACTIVE state.

- A couple fixes for issues the DM snapshot target's optional discard
  support added during first week of the 5.3 merge.

- Increase default size of outstanding IO that is allowed for a each
  dm-kcopyd client and introduce tunable to allow user adjust.

- Update DM core to use printk ratelimiting functions rather than
  duplicate them and in doing so fix an issue where DMDEBUG_LIMIT() rate
  limited KERN_DEBUG messages had excessive "callbacks suppressed"
  messages.

----------------------------------------------------------------
Damien Le Moal (1):
      dm zoned: fix zone state management race

Mike Snitzer (2):
      dm snapshot: fix oversights in optional discard support
      dm: use printk ratelimiting functions

Nikos Tsironis (1):
      dm kcopyd: Increase default sub-job size to 512KB

 drivers/md/dm-kcopyd.c         | 34 ++++++++++++++++++++++++++++------
 drivers/md/dm-snap.c           | 10 ++++++++++
 drivers/md/dm-zoned-metadata.c | 24 ------------------------
 drivers/md/dm-zoned.h          | 28 ++++++++++++++++++++++++----
 include/linux/device-mapper.h  | 17 ++++-------------
 5 files changed, 66 insertions(+), 47 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C817870C
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jul 2019 10:13:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 845573082E57;
	Mon, 29 Jul 2019 08:13:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E90600F8;
	Mon, 29 Jul 2019 08:13:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 984171800239;
	Mon, 29 Jul 2019 08:12:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6T0c5fc006535 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jul 2019 20:38:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09E485D705; Mon, 29 Jul 2019 00:38:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0464C5B683
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 00:38:02 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86930307D8BE
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 00:38:01 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id x24so65789067ioh.16
	for <dm-devel@redhat.com>; Sun, 28 Jul 2019 17:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=P/bfC/9DYsjpqYrAz/GLNeevsKIsGM5ry8dJO/L9Ihk=;
	b=aPt4emkJ9evkwceKXtVt5vKAigsQCZ1lgeypftDwzl/ljdnoLCtTtO5cyq7x2fdgqU
	1cQtdc0BN2UZ0tjhVSJGZh0hVLCbU1kpDIHF71T0QNkn8dqrI5D4D4Z9TXpCOBhgfnhC
	vfvDKFGeiZaQeHYJUmgwkgXdPn3LwBM/gFTfrOqemp2oPrq7m+iG4cGcKKc5LogJSo+I
	Wv6bhi7UdErygtWSAQL9lGL/k2QBZpHLgAlmuztrOdNBpe/v57AdqQ+QMy8/w/7A/Q4m
	ajFWR3xNDjjm/q0Ax1M140VaqS69EB0VNxoW56yF19Xi31WtIJbDMfjE/9gr4Xgf9/hk
	IH+w==
X-Gm-Message-State: APjAAAXv1n5FJZ2OWjjkPsMRFaM86gU/HODov1dwN+Ma5Td0+REP8XSe
	Y1WgzmEerCRomY7ZHCpywNMJ7aaJxR1i1P1wGpJpDYSnjEzA
X-Google-Smtp-Source: APXvYqwVilF5qTRSsaLkhL6POlQdbplmHCUtbsaCjcw6sv9rHxSg5wY2IEL+f/ULWS/npxF51AhFcSpVnuGNfy6+mXTXpQgpNXm3
MIME-Version: 1.0
X-Received: by 2002:a05:6638:40c:: with SMTP id
	q12mr81494815jap.17.1564360680847; 
	Sun, 28 Jul 2019 17:38:00 -0700 (PDT)
Date: Sun, 28 Jul 2019 17:38:00 -0700
In-Reply-To: <000000000000c75fb7058ba0c0e4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aec4ec058ec71a3d@google.com>
From: syzbot <syzbot+03e5c8ebd22cc6c3a8cb@syzkaller.appspotmail.com>
To: agk@redhat.com, axboe@kernel.dk, coreteam@netfilter.org,
	davem@davemloft.net, dm-devel@redhat.com, hdanton@sina.com,
	kaber@trash.net, kadlec@blackhole.kfki.hu, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
	pablo@netfilter.org, shli@kernel.org, snitzer@redhat.com,
	syzkaller-bugs@googlegroups.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 29 Jul 2019 00:38:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 29 Jul 2019 00:38:01 +0000 (UTC) for IP:'209.85.166.69'
	DOMAIN:'mail-io1-f69.google.com' HELO:'mail-io1-f69.google.com'
	FROM:'36D8-XQkbAFEBHI3t44xAt881w.z77z4xDBxAv76Cx6C.v75@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com'
	RCPT:''
X-RedHat-Spam-Score: 3.054 *** (FROM_LOCAL_HEX, HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SORTED_RECIPS,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.69 mail-io1-f69.google.com 209.85.166.69
	mail-io1-f69.google.com
	<36D8-XQkbAFEBHI3t44xAt881w.z77z4xDBxAv76Cx6C.v75@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jul 2019 04:12:23 -0400
Subject: Re: [dm-devel] memory leak in bio_copy_user_iov
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 29 Jul 2019 08:13:09 +0000 (UTC)

syzbot has bisected this bug to:

commit 664820265d70a759dceca87b6eb200cd2b93cda8
Author: Mike Snitzer <snitzer@redhat.com>
Date:   Thu Feb 18 20:44:39 2016 +0000

     dm: do not return target from dm_get_live_table_for_ioctl()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13f4eb64600000
start commit:   0011572c Merge branch 'for-5.2-fixes' of git://git.kernel...
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=100ceb64600000
console output: https://syzkaller.appspot.com/x/log.txt?x=17f4eb64600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb38d33cd06d8d48
dashboard link: https://syzkaller.appspot.com/bug?extid=03e5c8ebd22cc6c3a8cb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13244221a00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117b2432a00000

Reported-by: syzbot+03e5c8ebd22cc6c3a8cb@syzkaller.appspotmail.com
Fixes: 664820265d70 ("dm: do not return target from  
dm_get_live_table_for_ioctl()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

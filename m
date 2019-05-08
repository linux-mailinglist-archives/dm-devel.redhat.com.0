Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68517523
	for <lists+dm-devel@lfdr.de>; Wed,  8 May 2019 11:30:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D355883A2;
	Wed,  8 May 2019 09:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B18625D9C8;
	Wed,  8 May 2019 09:29:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1EF741F3D;
	Wed,  8 May 2019 09:29:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x489TYDh031569 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 05:29:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30E311A267; Wed,  8 May 2019 09:29:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9FA716BF0;
	Wed,  8 May 2019 09:29:29 +0000 (UTC)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A8F283F51;
	Wed,  8 May 2019 09:29:26 +0000 (UTC)
Received: from [81.155.195.4] (helo=[192.168.1.118])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>)
	id 1hOItA-0006Nd-4w; Wed, 08 May 2019 10:29:24 +0100
To: Song Liu <liu.song.a23@gmail.com>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
	<c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
	<CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
From: Wols Lists <antlists@youngman.org.uk>
Message-ID: <5CD2A172.4010302@youngman.org.uk>
Date: Wed, 8 May 2019 10:29:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Wed, 08 May 2019 09:29:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 08 May 2019 09:29:28 +0000 (UTC) for IP:'85.233.160.19'
	DOMAIN:'smtp.hosts.co.uk' HELO:'smtp.hosts.co.uk'
	FROM:'antlists@youngman.org.uk' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 85.233.160.19 smtp.hosts.co.uk 85.233.160.19
	smtp.hosts.co.uk <antlists@youngman.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	kernel@gpiccoli.net, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 2/2] md/raid0: Do not bypass blocking queue
 entered for raid0 bios
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 08 May 2019 09:30:06 +0000 (UTC)

On 06/05/19 22:07, Song Liu wrote:
> Could you please run a quick test with raid5? I am wondering whether
> some race condition could get us into similar crash. If we cannot easily
> trigger the bug, we can process with this version.

Bear in mind I just read the list and write documentation, but ...

My gut feeling is that if it can theoretically happen for all raid
modes, it should be fixed for all raid modes. What happens if code
changes elsewhere and suddenly it really does happen for say raid-5?

On the other hand, if fixing it in md.c only gets tested for raid-0, how
do we know it will actually work for other raids if they do suddenly
start falling through.

Academic purity versus engineering practicality :-)

Cheers,
Wol

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

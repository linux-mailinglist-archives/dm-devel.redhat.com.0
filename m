Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA3217E96
	for <lists+dm-devel@lfdr.de>; Wed,  8 May 2019 18:54:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1A95300412D;
	Wed,  8 May 2019 16:54:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF341600C6;
	Wed,  8 May 2019 16:54:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3587541F58;
	Wed,  8 May 2019 16:54:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48Gr9pM025332 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 12:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E6C91718E; Wed,  8 May 2019 16:53:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58DBE5C226;
	Wed,  8 May 2019 16:53:05 +0000 (UTC)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDB2830832E1;
	Wed,  8 May 2019 16:53:02 +0000 (UTC)
Received: from [81.155.195.4] (helo=[192.168.1.118])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>)
	id 1hOPoT-0001Zo-3p; Wed, 08 May 2019 17:53:01 +0100
To: "Guilherme G. Piccoli" <guilherme@gpiccoli.net>,
	Song Liu <liu.song.a23@gmail.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
	<c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
	<CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
	<5CD2A172.4010302@youngman.org.uk>
	<0ad36b2f-ec36-6930-b587-da0526613567@gpiccoli.net>
From: Wols Lists <antlists@youngman.org.uk>
Message-ID: <5CD3096B.4030302@youngman.org.uk>
Date: Wed, 8 May 2019 17:52:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <0ad36b2f-ec36-6930-b587-da0526613567@gpiccoli.net>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Wed, 08 May 2019 16:53:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 08 May 2019 16:53:04 +0000 (UTC) for IP:'85.233.160.19'
	DOMAIN:'smtp.hosts.co.uk' HELO:'smtp.hosts.co.uk'
	FROM:'antlists@youngman.org.uk' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 85.233.160.19 smtp.hosts.co.uk 85.233.160.19
	smtp.hosts.co.uk <antlists@youngman.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	kernel@gpiccoli.net, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 08 May 2019 16:54:42 +0000 (UTC)

On 08/05/19 15:52, Guilherme G. Piccoli wrote:
> Hi, I understand your concern. But all other raid levels contains
> failure-event mechanisms. For example, in all my tests with raid5 or
> raid1, it first complained the device was removed, then it failed in
> super_written() when no other available device was present.
> On the other hand, raid0 does "blind-writes": it just selects the device
> in which that bio should be written (given the stripe math) and change
> the bio's device, sending it back via generic_make_request(). It's
> dummy, but not in a bad way, but rather for performance reasons. It has
> no "intelligence" for failures, as all other raid levels.
> 
> That said, we could fix md.c for all raid levels, but I personally think
> it's a bazooka shot, only raid0 shows consistently this issue.
> 
The academic in me says we should push that error handling into
generic_make_request() or some raid function in md.c that deals with
those problems. Sounds like there's a fair bit of duplicate
functionality that could be re-factored out.
>>
>> Academic purity versus engineering practicality :-)
> 
> Heheh you have good points here! Thanks for the input =)
> Cheers,
> 
Doesn't help when there's not an architect to design an overall "grand
scheme", but my usual way of working is to design top down academically,
and then ask myself "what do I need" before implementing bottom-up.
Hopefully with a load of documentation saying "I haven't done this
because I don't need it, but this is where it goes".

Cheers,
Wol

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

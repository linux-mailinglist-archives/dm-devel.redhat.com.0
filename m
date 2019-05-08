Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E5281186FE
	for <lists+dm-devel@lfdr.de>; Thu,  9 May 2019 10:47:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 979FC307E060;
	Thu,  9 May 2019 08:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2C219744;
	Thu,  9 May 2019 08:47:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D6A341F56;
	Thu,  9 May 2019 08:46:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48EqcBM030798 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 10:52:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 801C15C21F; Wed,  8 May 2019 14:52:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C9961D0E
	for <dm-devel@redhat.com>; Wed,  8 May 2019 14:52:36 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CAB5882EA
	for <dm-devel@redhat.com>; Wed,  8 May 2019 14:52:35 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z128so9928228qkb.6
	for <dm-devel@redhat.com>; Wed, 08 May 2019 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gpiccoli-net.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oR87S8WBYmHgl5a+7jWu2q8y1uPVcvlNQs6xTyZfoBs=;
	b=HSJkz+W7UbsM6YFJBlNG8zvAh7hXOdrJWjz0mQIEFX/UdESqZFDUMXnGjqtFr/+ssW
	19UhvMqM6laGrt+bZZhu8l3WzIbsgCapA4BOujeCEPmEnsy4k1TqEY4x6iFS6bguvM33
	q1A217OVdC5ooInkdp92II0oGwFQgbB/2Of33Df5MC4mmk6mpQeariwavEJEWwxrZdpo
	+nOP8vjuM31eB5tBBlHBuKp7DMXbSZl640vQP8iERWmh62mawe2mMn2A5zbXcQB2oDoz
	BW0JNow5oreIEqQzvxkqK+eULht1xMjYpn9iJ2BWvycLe9GetJQYHS3hsGbi0pH+1VEj
	9Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oR87S8WBYmHgl5a+7jWu2q8y1uPVcvlNQs6xTyZfoBs=;
	b=WATiZTtKByfySjUvPflubpag4TApZkgoObDBxVgWj07T7iWzn30dVl9rwAwttZWDAL
	y561SCmjz2uT2YKbo7usoKhYluBpPqDHHBwfT3YbvUb0/2/Jk4GCxkDul1XXeeHf3ft2
	0n3LfBt5ani7JPy+fABwU+47hJebFzLlieXWVbuYv38j+FsMD+Fd8UXcn1NS89epAbNo
	rR6UDBspaEBJ/gZOYEB4dkKwqBPmRFO4KYH1gfRi0ORD63N4Ru4vClpMlMtlxZ2giQO8
	aBwAyzI5u0dIBlYm2RRVQb0psmtyPcjQgI7AT9N8RjUlBgH5I7X4BkWaa7ajltME3L/r
	zknw==
X-Gm-Message-State: APjAAAUDqa5AZKaujZ0buyrtJjDTi2BDveK5TU96LsFB6HfTsJMqYVpG
	0SZcgRcOPktYOOk18VUCu2jWDw==
X-Google-Smtp-Source: APXvYqyRQBj5ZqXJ0cyRTp/xjLuwux0kH0/Bh97mjgL0YlcRfvD+8QdfWTSo2QE570g+M8jw0/i+mQ==
X-Received: by 2002:a05:620a:166e:: with SMTP id
	d14mr1999024qko.11.1557327154295; 
	Wed, 08 May 2019 07:52:34 -0700 (PDT)
Received: from [192.168.1.10] (201-92-248-20.dsl.telesp.net.br.
	[201.92.248.20]) by smtp.gmail.com with ESMTPSA id
	d127sm8866496qkf.8.2019.05.08.07.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 07:52:33 -0700 (PDT)
To: Wols Lists <antlists@youngman.org.uk>, Song Liu <liu.song.a23@gmail.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
	<c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
	<CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
	<5CD2A172.4010302@youngman.org.uk>
From: "Guilherme G. Piccoli" <guilherme@gpiccoli.net>
Message-ID: <0ad36b2f-ec36-6930-b587-da0526613567@gpiccoli.net>
Date: Wed, 8 May 2019 11:52:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CD2A172.4010302@youngman.org.uk>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 08 May 2019 14:52:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 08 May 2019 14:52:35 +0000 (UTC) for IP:'209.85.222.195'
	DOMAIN:'mail-qk1-f195.google.com'
	HELO:'mail-qk1-f195.google.com' FROM:'guilherme@gpiccoli.net'
	RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.222.195
	mail-qk1-f195.google.com 209.85.222.195
	mail-qk1-f195.google.com <guilherme@gpiccoli.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 May 2019 04:46:45 -0400
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 09 May 2019 08:47:37 +0000 (UTC)

On 5/8/19 6:29 AM, Wols Lists wrote:
> On 06/05/19 22:07, Song Liu wrote:
>> Could you please run a quick test with raid5? I am wondering whether
>> some race condition could get us into similar crash. If we cannot easily
>> trigger the bug, we can process with this version.
> 
> Bear in mind I just read the list and write documentation, but ...
> 
> My gut feeling is that if it can theoretically happen for all raid
> modes, it should be fixed for all raid modes. What happens if code
> changes elsewhere and suddenly it really does happen for say raid-5?
> 
> On the other hand, if fixing it in md.c only gets tested for raid-0, how
> do we know it will actually work for other raids if they do suddenly
> start falling through.

Hi, I understand your concern. But all other raid levels contains 
failure-event mechanisms. For example, in all my tests with raid5 or 
raid1, it first complained the device was removed, then it failed in 
super_written() when no other available device was present.
On the other hand, raid0 does "blind-writes": it just selects the device 
in which that bio should be written (given the stripe math) and change 
the bio's device, sending it back via generic_make_request(). It's 
dummy, but not in a bad way, but rather for performance reasons. It has 
no "intelligence" for failures, as all other raid levels.

That said, we could fix md.c for all raid levels, but I personally think 
it's a bazooka shot, only raid0 shows consistently this issue.

> 
> Academic purity versus engineering practicality :-)

Heheh you have good points here! Thanks for the input =)
Cheers,


Guilherme


> 
> Cheers,
> Wol
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247D6721E
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 17:14:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFD103003A5A;
	Fri, 12 Jul 2019 15:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9CB600CD;
	Fri, 12 Jul 2019 15:14:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2315E1833002;
	Fri, 12 Jul 2019 15:14:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CFDS79004979 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 11:13:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38C395B695; Fri, 12 Jul 2019 15:13:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E66546E0
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 15:13:00 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CEF381111
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 15:12:58 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u19so20993552ior.9
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TgV+P5xUNL5epV/ZpLeslnEZ8CdbgVF9nNrx/k03o8g=;
	b=CGNvk4/dqGZ6+i1O+wfwJKZoo7ZYVaVuFsXwbqWoKa2XITkHd3rk7eN+9PMEwi0ihT
	l0BWkPExicPNlcfnNhprd86+MADEO/JMKNcrEfFYDcy4UtSlyJGgqGti1tMF6ZQp1Pw7
	PgB5kmZlAOgYnnICnXaE4Ce6bjaK0DqQ1LgWCGLeCGYaGSWtlukgKp30GZNQ0H4JqKou
	Bhzr1mlWRh38YS94B8YBVD967PLS6In5oR2rO4WHBu5RroQ4ZqfcdoRTxKZGAbtzyhwH
	JSlZc1isR6qSYuSho0mHJeLajd0JRjwkmewOWFe26AkCy+6Kjq6/vqcAg+wTP3Y8clDE
	OwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TgV+P5xUNL5epV/ZpLeslnEZ8CdbgVF9nNrx/k03o8g=;
	b=sU9q3G3aL6k1j/FE/QWVxHppBlQOXcqVGWVyfDbksmKxaom5h5nA8xHfZevg0yJhzD
	r1HtOKv/hDj/iZsbzVlU/IXOHS7lm1rLjMZ5fmyeHxw0EOP1/dNSPfDkKXF47WcCwMPl
	X4yvKmEOUMGk6o0oxKSB9a4h7yjUs7cEW8CUPzlfv/VV2u7wJhml+I1VOi0J4AA21MUj
	qF1kLNxVlK5qza4C7B+AVU6n4jGnR+Fs4y/jwdTHZfkuc8RflnjDvvfp97DLQU2SRTjk
	90Lmp3RB04tesuubD7Xy8cdyN4xnIyvjEJQz3M6cEIuVEldCdruPp9g/xuS6YxkJdLD8
	annw==
X-Gm-Message-State: APjAAAXgZOZ/amBiQvl7LCY5PqO1hIYfGPU/FqAarpoOz8pVqJpSVPe4
	3xfXjI37T4r9vSF8d/ocTMk=
X-Google-Smtp-Source: APXvYqzNOs4ktys5P/q5Zi/E8ueb3gbQD/m0JLYFVa+rUUweNFsMDDkgPqUBftGoeg2lyKpUDsUArg==
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr11632533ion.239.1562944377622; 
	Fri, 12 Jul 2019 08:12:57 -0700 (PDT)
Received: from [192.168.1.158] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id
	l5sm15960501ioq.83.2019.07.12.08.12.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jul 2019 08:12:56 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
	<BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
	<cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
Message-ID: <27386e10-7494-7fcf-f203-484db5c3c69c@kernel.dk>
Date: Fri, 12 Jul 2019 09:12:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 12 Jul 2019 15:12:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 12 Jul 2019 15:12:59 +0000 (UTC) for IP:'209.85.166.65'
	DOMAIN:'mail-io1-f65.google.com' HELO:'mail-io1-f65.google.com'
	FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 1.294 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.65 mail-io1-f65.google.com 209.85.166.65
	mail-io1-f65.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 0/4] Fix zone revalidation memory
	allocation failures
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 12 Jul 2019 15:14:38 +0000 (UTC)

On 7/11/19 8:05 PM, Jens Axboe wrote:
> On 7/7/19 8:02 PM, Damien Le Moal wrote:
>> On 2019/07/01 14:09, Damien Le Moal wrote:
>>> This series addresses a recuring problem with zone revalidation
>>> failures observed during extensive testing with memory constrained
>>> system and device hot-plugging.
>>
>> Jens, Martin,
>>
>> Any comment regarding this series ?
> 
> LGTM, I'll queue it up for this release.

This broke !CONFIG_BLK_DEV_ZONED builds for null_blk, btw. Please be
sure to test with zoned enabled and disabled in your builds when
changing things that affect both.

I fixed it up:

http://git.kernel.dk/cgit/linux-block/commit/?h=for-linus&id=e347946439ed70e3af0d0c330b36d5648e71727b

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

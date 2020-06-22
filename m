Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 037E3203129
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 09:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592812758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fWoQQPXt54I91GPVpGrD66kca0nE/LGy8gQgolGpe68=;
	b=JrfgJ5rspCrWOByzYjeV+0+GAevwoFG2hvZFXwj7/7iaNKJmDbFs0wFHUf749et260xTFz
	B4MF7Z/tL0RgM601bv500lOMGlq/PskIQauiLS3RWeYr66uZdCkg20U2JMkLL6aSm4UFqq
	SopOtLN40xopvPnO1xZUMpXBjmT21Bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-xB9E9n-nO2-a2Vdon1TPiA-1; Mon, 22 Jun 2020 03:59:15 -0400
X-MC-Unique: xB9E9n-nO2-a2Vdon1TPiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CFB6800053;
	Mon, 22 Jun 2020 07:59:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4095BAE8;
	Mon, 22 Jun 2020 07:59:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 827041809547;
	Mon, 22 Jun 2020 07:58:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M7wlYT029696 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 03:58:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9D9A1002976; Mon, 22 Jun 2020 07:58:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5687110F3B0
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 07:58:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A75D9858EFE
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 07:58:44 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-NdnusWRWMDi-Ipn5X1UpMg-1; Mon, 22 Jun 2020 03:58:40 -0400
X-MC-Unique: NdnusWRWMDi-Ipn5X1UpMg-1
Received: by mail-wm1-f66.google.com with SMTP id 17so163437wmo.1;
	Mon, 22 Jun 2020 00:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mMMBH/im23ji4fEv1Kmx2CsCljHtX5RHIV2g8cbxlsI=;
	b=BZKLSl0xBKPughir48/pR+fBq0VQqjik0tV2S0OnistSBPoDkSWSrSBJFw0qG/RHuc
	4os+n5cwPevzTYU0qlPXik8asQkPEIDTw7INnTsGJIQKjxvfyWMm6rL/ftibs3vkjs3b
	TiZKdFjycTWoDmNBF5eHyDi3nT41PrM3T6BluXDVXAC/m7FsZy5szsKA5dx17HibVuqd
	gzLv9ztoG7QhqEQleyREk/3DJFDfc5U7NzsTzkhOZnQILtUMwUKnZb21yPRXJ0rZRG9d
	Do3W0BFxIfMHZW8g9SKrs9DR3Yw+4rgCra5gmo8dXXxULZyykXP8C2y8qtpmHNWmAnUl
	wvsQ==
X-Gm-Message-State: AOAM532Dg5WLjAH5pwR8FqYuo0g6zN9/yel59INTFcKUg40zDkKnEdUi
	YyVc5ijVrEDE5XJZkZORCR4=
X-Google-Smtp-Source: ABdhPJzDatIBw65qbZ5xHtyEjDhL1ClxOVFqmJb4kWMFvawdCgy+PRswhDHVwQx5Mv0OCGrL4+RRBQ==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr6908746wma.180.1592812719000; 
	Mon, 22 Jun 2020 00:58:39 -0700 (PDT)
Received: from [172.22.36.87] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	b19sm22358112wmj.0.2020.06.22.00.58.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 22 Jun 2020 00:58:38 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>, Sami Tolvanen <samitolvanen@google.com>
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
	<20200618154444.GB18007@redhat.com>
	<20200618165006.GA103290@google.com>
	<20200618170952.GA18057@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <b7eaf4a7-6692-ffdf-2bbc-b622f93ef601@gmail.com>
Date: Mon, 22 Jun 2020 09:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618170952.GA18057@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	JeongHyeon Lee <jhs2.lee@samsung.com>, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] New mode DM-Verity error handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18/06/2020 19:09, Mike Snitzer wrote:
> On Thu, Jun 18 2020 at 12:50pm -0400,
> Sami Tolvanen <samitolvanen@google.com> wrote:
> 
>> On Thu, Jun 18, 2020 at 11:44:45AM -0400, Mike Snitzer wrote:
>>> I do not accept that panicing the system because of verity failure is
>>> reasonable.
>>>
>>> In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.
>>>
>>> The device should be put in a failed state and left for admin recovery.
>>
>> That's exactly how the restart mode works on some Android devices. The
>> bootloader sees the verification error and puts the device in recovery
>> mode. Using the restart mode on systems without firmware support won't
>> make sense, obviously.
> 
> OK, so I need further justification from Samsung why they are asking for
> this panic mode.

I think when we have reboot already, panic is not much better :-)

Just please note that dm-verity is used not only in Android world (with own tooling)
but in normal Linux distributions, and I need to modify userspace (veritysetup) to support
and recognize this flag.

Please *always* increase minor dm-verity target version when adding a new feature
- we can then provide some better hint if it is not supported.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


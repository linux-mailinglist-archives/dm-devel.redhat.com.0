Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 125E9204B12
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jun 2020 09:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592897364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YhF14yEZphUcAPtHWJr4IrtpZbZmUA8/jqxCEVpaA3k=;
	b=Ufp2HXNDV7SK+qZy01PUCcR5r7D7wGkYgizv2cHvAfS9aOl61jz5pPjZ94OYgPhXMhr/1c
	HPsoKoZwlODMLJXyxI7K7cbjqmEqVC+jQdIgcSdIqxazn4NPn1cqOJuFg8N1cNbTFx8E8J
	eHZV5ml4YqgJWz4aScC5BbF2a2ZdDvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-lDIOKkIMM4WPbigWGU5V1Q-1; Tue, 23 Jun 2020 03:29:22 -0400
X-MC-Unique: lDIOKkIMM4WPbigWGU5V1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF9288018AB;
	Tue, 23 Jun 2020 07:29:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F04CF612A5;
	Tue, 23 Jun 2020 07:29:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BA551809547;
	Tue, 23 Jun 2020 07:28:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05N7SeIs025957 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 03:28:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A668215688E; Tue, 23 Jun 2020 07:28:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6649D2156A54
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 07:28:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 467DF8007B1
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 07:28:38 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-uOvTYFzJOTS6tUYAUv302Q-1; Tue, 23 Jun 2020 03:28:35 -0400
X-MC-Unique: uOvTYFzJOTS6tUYAUv302Q-1
Received: by mail-wm1-f68.google.com with SMTP id q15so319036wmj.2;
	Tue, 23 Jun 2020 00:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eAOzaLEvri148C9yhZfXxhkQ6ShWPHEsBtHOhazXNYw=;
	b=NBrkPpbIDfpgxDsVLjnjjlMn6E+TWZIyTzCAq9JU1Jyo0LmzoDtZTXryqSgcsFQHrN
	Szpk9SlkksPiaajDbyv/6Q0QstFS0tbySIGHKi8S638MVguBvEm5pIZHtT48aru5VbXt
	24bajanu8a1Mo4/uHJWd+lE672lzE21xvQZY1cXUbiZKQnvdxL0A5SfGCPws4Ys0UDZD
	QYZKcJxCV/CO76Zy/jctyuu7knrr/VI3i0sjzl0sW1GLNvaJMS5sCnlzfWu4jmMINZp6
	QuWH/njGebyC20x/TFty7/y6nsDKLbNpI+928+z2bPDMI1w6TRICdhE9MTU+oENAMGsm
	yOGw==
X-Gm-Message-State: AOAM533g9Tw7lvJhL2yx0XZmPtu9I4n4WGbs1hmXv/sD98MFn/0Q1ecs
	n3RwFbdhnTzk+TJnhLlt75A=
X-Google-Smtp-Source: ABdhPJzuz4+aXy0DOjxqXCya5QX3G7FXScweqlUDkFN+8wby91HADp2yldiuF1+TtlQwjLBQ2at4Ig==
X-Received: by 2002:a1c:6102:: with SMTP id v2mr20964522wmb.6.1592897314040;
	Tue, 23 Jun 2020 00:28:34 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	185sm2496882wmz.22.2020.06.23.00.28.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 23 Jun 2020 00:28:33 -0700 (PDT)
To: JeongHyeon Lee <jhs2.lee@samsung.com>, Mike Snitzer <snitzer@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
	<20200618154444.GB18007@redhat.com>
	<20200618165006.GA103290@google.com>
	<20200618170952.GA18057@redhat.com>
	<b7eaf4a7-6692-ffdf-2bbc-b622f93ef601@gmail.com>
	<250156a6-a2d6-dbfd-daa3-be9c36f0cf36@samsung.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <2c3bf8c1-c742-b1e9-6ff6-91b2253638e1@gmail.com>
Date: Tue, 23 Jun 2020 09:28:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <250156a6-a2d6-dbfd-daa3-be9c36f0cf36@samsung.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	agk@redhat.com, linux-doc@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/06/2020 01:53, JeongHyeon Lee wrote:
> 
> For what reason isn't panic better?

I did not say panic is better, I said that while we have restart already in mainline dm-verity code,
panic() is almost the same, so I see no problem in merging this patch.

Stopping system this way could create more damage if it is not configured properly,
but I think it is quite common to stop the system as fast as possible if data system integrity
is violated...

> If when i suggested new patch, i will send you a patch that increased 
> minor version.

I think Mike can fold-in version increase, if the patch is accepted.

But please include these version changes with every new feature.

Actually I am tracking it here for dm-verity as part of veritysetup userspace documentation:
  https://gitlab.com/cryptsetup/cryptsetup/-/wikis/DMVerity

Thanks,
Milan

> On 22/06/2020 16:58, Milan Broz wrote:
>> On 18/06/2020 19:09, Mike Snitzer wrote:
>>> On Thu, Jun 18 2020 at 12:50pm -0400,
>>> Sami Tolvanen <samitolvanen@google.com> wrote:
>>>
>>>> On Thu, Jun 18, 2020 at 11:44:45AM -0400, Mike Snitzer wrote:
>>>>> I do not accept that panicing the system because of verity failure is
>>>>> reasonable.
>>>>>
>>>>> In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.
>>>>>
>>>>> The device should be put in a failed state and left for admin recovery.
>>>> That's exactly how the restart mode works on some Android devices. The
>>>> bootloader sees the verification error and puts the device in recovery
>>>> mode. Using the restart mode on systems without firmware support won't
>>>> make sense, obviously.
>>> OK, so I need further justification from Samsung why they are asking for
>>> this panic mode.
>> I think when we have reboot already, panic is not much better :-)
>>
>> Just please note that dm-verity is used not only in Android world (with own tooling)
>> but in normal Linux distributions, and I need to modify userspace (veritysetup) to support
>> and recognize this flag.
>>
>> Please *always* increase minor dm-verity target version when adding a new feature
>> - we can then provide some better hint if it is not supported.
>>
>> Thanks,
>> Milan
>>
>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


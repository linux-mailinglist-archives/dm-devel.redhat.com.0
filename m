Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 52CC01A2730
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 18:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586363322;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=viTsCsu1Jv91oceJKwh6mrRBauHr3fj2d/xlMPF5VV8=;
	b=UlwvX0Ty/74yQXEKrlZUHe/zc8dpJIW+6a+/3+GZ3o33ryDO/DApAGI02hmfckpgaW3wSI
	RrHpCTVxtPTYCahq5L/GDYvl5jLrMO9OzQaWWLZaxL+ZM5dqmnUDMGImtFB5lwXm9Gbq98
	dntXFHXnPZ35r+WMeFsIH62pUs6GTGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Zdw8LdHaP5-9pt6BbCPdXw-1; Wed, 08 Apr 2020 12:28:39 -0400
X-MC-Unique: Zdw8LdHaP5-9pt6BbCPdXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1B1C107ACC4;
	Wed,  8 Apr 2020 16:28:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B77689B912;
	Wed,  8 Apr 2020 16:28:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9983518089CD;
	Wed,  8 Apr 2020 16:28:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038GSBw7024005 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 12:28:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD68E113F65; Wed,  8 Apr 2020 16:28:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8A91113F6F
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 16:28:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30D638F7A11
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 16:28:09 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-dSKvjzOsPnS0Jbz0QoIEJA-1; Wed, 08 Apr 2020 12:28:07 -0400
X-MC-Unique: dSKvjzOsPnS0Jbz0QoIEJA-1
Received: by mail-wm1-f67.google.com with SMTP id f20so72768wmh.3
	for <dm-devel@redhat.com>; Wed, 08 Apr 2020 09:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HAAR9LDaXSMN6fmU0N4hL9Thu7DJnpi8s/NSBuY2LU8=;
	b=QQcvA63vgnlTWDZtstNXI67Zab0RfU1kES1xZzd1sgIo35PAx51SgWw7pCuzfMArNC
	QZdWQ/mxStimhp8FRRK8xU6+b2ddqXu6RTlmg+j3lHsIDBm3AbCYpP58GrBe2C41l9h+
	YxuEnZAl8mCwTB9jhaRCT0vFGekn+iqm2Nqt2PGrm4JnCz0NjMZUpXMlE02smGONM/bL
	3N22YLQ/ZwP1BE4x5HzCprlluTqLbbjtyZ9e5Aehwx3iO+DpCA5A9KSQNM/cvCPp5eip
	/RZrQ1j04bzpLYF2O2WW8q5NxlMvEF4RmWfZKyqPVW0JF9QMpxRULZLq/QtSZ0WurUif
	YB8g==
X-Gm-Message-State: AGi0PuY0r2pBOVupSETFeOH5c1K5GP6lAooEXu3hKaj5txClEl/Vb2Pv
	wT1RIgzRdS5bZspMogP/+9o=
X-Google-Smtp-Source: APiQypJPZgpqG2YbA8mwXTXx1vX3g4+A3N5go8g7d3L+94vBi4i9aqAgJaRT+zZ8xPsnIdPVGVJuHA==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr5214728wmc.129.1586363285860; 
	Wed, 08 Apr 2020 09:28:05 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	o16sm36533957wrs.44.2020.04.08.09.28.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Apr 2020 09:28:05 -0700 (PDT)
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, zohar@linux.ibm.com,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	dm-devel@redhat.com
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <76a9556d-b141-d26f-7b3c-3887d3a4ae16@gmail.com>
Date: Wed, 8 Apr 2020 18:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, nramas@linux.microsoft.com, jmorris@namei.org,
	chpebeni@linux.microsoft.com, suredd@microsoft.com, balajib@microsoft.com
Subject: Re: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and
	selinux
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 08/04/2020 12:19, Tushar Sugandhi wrote:
> The goals of the kernel integrity subsystem are to detect if files have
> been accidentally or maliciously altered, both remotely and locally,
> appraise a file's measurement against a "good" value stored as an
> extended attribute, and enforce local file integrity [1].
> 
> To achieve these goals, IMA subsystem measures several in-memory
> constructs and files.
> 
> We propose to measure constructs in dm-crypt and selinux to further
> enhance measuring capabilities of IMA.

...

> Proposal:
> ---------
> A. Measuring dmcrypt constructs:
>      We can add an IMA hook in crypt_ctr() present in
>      drivers/md/dm-crypt.c, so that IMA can start measuring the status of
>      various dm-crypt targets (represented by crypt_target struct - also
>      defined in dm-crypt.c).

Hi,

I do not think you should just cherry-pick dm-crypt here. What about other
device-mapper targets? Apparently, dm-verity or dm-integrity are obvious
candidates too.

But device-mapper logic is based on stacking devices, so in generic case
(not just in some very special embedded configuration) you need to measure
the whole stack of devices.
(Just imagine a target stacked below dm-crypt that decrypts the device or so. :-)

Moreover, dm-crypt allows some specific actions like wiping and reloading
of the encryption key through device-mapper dm-crypt message.
If you check parameter only in crypt_ctr, this message path must be disabled,
basically crippling dm-crypt functionality (it is intended to wipe key in-memory
during hw suspend).


IMO if you want implement something like IMA measurement, I think you should
implement it in device-mapper core, and provide support for all targets.

I guess some new target specific callback is needed and some flags that
could enforce/disable stacking if a IMA measurement is in place etc.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


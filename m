Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 890BF1A8D8C
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 23:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586899175;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0+1oHRQfILJHLeulog9E1nSemsSPxK3l89dVol9gwR4=;
	b=dHaEqORS/coEa72rxOglUAPUWRGM9k8xL68hPeCxi7obFZdCi+G+Su3zXHM3LhqPqfjXEI
	IIpEQQpvvRmmX6Uvh+QPt7UAqY+NoRyug0Z7KyZc//HKR4Uvqnt3BKbQNg7e6ZA+s3UB4y
	uNTgUjuHKqzlUa9mXm0C3t/pDRXiwNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-ilIltA33ODyuAbOqBzgzFg-1; Tue, 14 Apr 2020 17:19:32 -0400
X-MC-Unique: ilIltA33ODyuAbOqBzgzFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 551BC8018A5;
	Tue, 14 Apr 2020 21:19:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8A91001902;
	Tue, 14 Apr 2020 21:19:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5183A93069;
	Tue, 14 Apr 2020 21:19:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03ELIs4i029329 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 17:18:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6799410031E5; Tue, 14 Apr 2020 21:18:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 637D01004039
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 21:18:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170C3868CB8
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 21:18:52 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-266-KFv8wZz9Piy7zCYh0Q7rtg-1;
	Tue, 14 Apr 2020 17:18:48 -0400
X-MC-Unique: KFv8wZz9Piy7zCYh0Q7rtg-1
Received: from [10.137.106.115] (unknown [131.107.174.243])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3E91D20B4737;
	Tue, 14 Apr 2020 14:18:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3E91D20B4737
To: Jonathan Corbet <corbet@lwn.net>
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
	<20200406221439.1469862-12-deven.desai@linux.microsoft.com>
	<20200414093809.2c6ef93b@lwn.net>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <9c55bbe9-2c6e-7a0d-cf90-5b2aee724f19@linux.microsoft.com>
Date: Tue, 14 Apr 2020 14:18:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414093809.2c6ef93b@lwn.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03ELIs4i029329
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
	jmorris@namei.org, zohar@linux.ibm.com,
	mdsakib@linux.microsoft.com, linux-block@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH v2 11/12] documentation: Add IPE
	Documentation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit


On 4/14/2020 8:38 AM, Jonathan Corbet wrote:
> On Mon,  6 Apr 2020 15:14:38 -0700
> deven.desai@linux.microsoft.com wrote:
>
>> From: Deven Bowers <deven.desai@linux.microsoft.com>
>>
>> Add IPE's documentation to the kernel tree.
>>
>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Thanks for including this nice documentation from the outset!  I have a
> couple of tiny nits to pick, but nothing really substantive to complain
> about, so:
>
>    Acked-by: Jonathan Corbet <corbet@lwn.net>

Thanks!

> [...]
>
>> +IPE is a Linux Security Module, which allows for a configurable policy
> I'd drop the comma (I told you these were nits!)

Got it, thanks!

>
> [...]
>
>> +IPE Policy
>> +~~~~~~~~~~
>> +
>> +IPE policy is designed to be both forward compatible and backwards
>> +compatible. There is one required line, at the top of the policy,
>> +indicating the policy name, and the policy version, for instance:
>> +
>> +::
>> +
>> +   policy_name="Ex Policy" policy_version=0.0.0
> This pattern can be compressed a bit by just putting the "::" at the end of
> the last line of text:
>
> 	indicating the policy name, and the policy version, for instance::
>
> 	   policy_name="Ex Policy" policy_version=0.0.0
>
> The result is a bit more readable in the plain-text format, IMO, and
> renders exactly the same in Sphinx.

Awesome. I'll address this feedback in v3.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


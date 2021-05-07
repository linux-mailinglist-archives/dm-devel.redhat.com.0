Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4074D376532
	for <lists+dm-devel@lfdr.de>; Fri,  7 May 2021 14:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620390738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zADC+MWS+7qrpR8J4www/9VBalew18DWQ+H2xbMdQRE=;
	b=HChfxctPy9a7NkogM5Wmb1c2GOM7RrEScvpGmV2Iv42Pv2KfsTn/fC9z7QwGx9DY0iB15m
	tLYkWLB+IKAvr2IO4fC0JGvPeWEfmdGjkGCmDj+3+/9CSykpwXjHmDkAVbeLNb7JHi34q8
	0SnDMNtanCRHSQX/+lD8WO+7PQMOgB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-lnOQ03qKOu6ybX2I9ziYZA-1; Fri, 07 May 2021 08:32:15 -0400
X-MC-Unique: lnOQ03qKOu6ybX2I9ziYZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1C77189DF41;
	Fri,  7 May 2021 12:32:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BBDC10074EF;
	Fri,  7 May 2021 12:32:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62A1118005B6;
	Fri,  7 May 2021 12:31:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 147CVkoH012341 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 May 2021 08:31:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92E626086F; Fri,  7 May 2021 12:31:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.40.194.133] (unknown [10.40.194.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1074F60877;
	Fri,  7 May 2021 12:31:45 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, dm-devel@redhat.com
References: <7104c94c-7408-0d58-ddd9-384102e820bc@msgid.tls.msk.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <6a71df25-d1fb-db02-ff55-384ba0828647@redhat.com>
Date: Fri, 7 May 2021 14:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7104c94c-7408-0d58-ddd9-384102e820bc@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] can we fix some dm snapshot crashes please? :)
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------3E1048EBC3E45C7914BA9FA4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3E1048EBC3E45C7914BA9FA4
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

Dne 07. 05. 21 v 12:31 Michael Tokarev napsal(a):
> Hi!
> 
> I asked this 1.5 years ago, but go no replies.
> 
> The thing is that we have a few bugs in kernel in snapshot-related area
> for years, maybe for decades, and the bugs are still there and it is still
> trivial to crash the kernel is you're not very-very-very careful.
> 
> This might be due to user error ofcourse, but this still is definitely
> NOT a valid reason for the crashes.
> 
> For example, here it goes for snapshot-origin dm target. Just create
> a snapshot-origin and do some activity on it, it is a 2-line reproducer:
> 
>   # first create a test device: it can be anything
>   # here we use a 100-MB loop device
>   truncate --size=100M base
>   losetup /dev/loop0 base
>   # now create the snapshot-origin on it
>   sz=$(blockdev --getsize /dev/loop0)
>   dmsetup create base --table "0 $sz snapshot-origin /dev/loop0"
>   # and now the crash
>   mkfs.ext4 /dev/mapper/base
> 
> This crashes instantly. Different kernels crashed a bit differently,
> I tried even some 3.x kernels. But the result is the same - crash.
> 
> Here's an example from 5.10 kernel:

Hi


Yes reproducible - can you please open BZ report here:

https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper

I assume you are aware you are trying to using snapshot target in wrong way,
but it should not be crashing kernel.

Regards

Zdeneek

--------------3E1048EBC3E45C7914BA9FA4
Content-Type: text/x-vcard;
 name="zkabelac.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="zkabelac.vcf"

bnVsbA==
--------------3E1048EBC3E45C7914BA9FA4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel
--------------3E1048EBC3E45C7914BA9FA4--


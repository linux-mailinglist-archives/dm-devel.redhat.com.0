Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 206EB19FEF7
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 22:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586204496;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tqXA+XOGDxmvJzsXckR+u3KslKoDWVcDyekQ8RHlMvU=;
	b=dkOtvFXjjx1pUCmaPGbANW7IVe4m1jvBpohbb4t3/jPzQnrCPm2Ek9ni/dMkjgmHsDzfgn
	R8qY3dDw+VFstAQbi8fcgzaweBtjuZxugdKo2C5tWAlGDqgsW6gR/ONiOUuPC9RwrlsaaP
	MgbtbYi5OHW47+8rGW9zSrUx9pllS3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-RwjhhqhIPj28UBT5niWtSw-1; Mon, 06 Apr 2020 16:21:30 -0400
X-MC-Unique: RwjhhqhIPj28UBT5niWtSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4318E8017F3;
	Mon,  6 Apr 2020 20:21:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5D2A0A6F;
	Mon,  6 Apr 2020 20:21:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D144993A70;
	Mon,  6 Apr 2020 20:21:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036KA6dD010809 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 16:10:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB3E81004023; Mon,  6 Apr 2020 20:10:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E77F8100404B
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 20:10:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9DA98007D9
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 20:10:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-407-hLkWJSHmOIObPsDnBvwpGw-1;
	Mon, 06 Apr 2020 16:09:59 -0400
X-MC-Unique: hLkWJSHmOIObPsDnBvwpGw-1
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C724A206C0;
	Mon,  6 Apr 2020 20:09:54 +0000 (UTC)
Date: Mon, 6 Apr 2020 16:09:53 -0400
From: Sasha Levin <sashal@kernel.org>
To: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <20200406200953.GH27528@sasha-vm>
References: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
	<CAG48ez3JV-tzjRLdcys6Fz9LKYaB1h-1GaeAzkUYtY1RgxsB6g@mail.gmail.com>
	<20200406185910.GA77950@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
In-Reply-To: <20200406185910.GA77950@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036KA6dD010809
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Apr 2020 16:20:58 -0400
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com, snitzer@redhat.com,
	Jann Horn <jannh@google.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
	James Morris <jmorris@namei.org>,
	Mimi Zohar <zohar@linux.ibm.com>, mdsakib@linux.microsoft.com,
	linux-block@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module <linux-security-module@vger.kernel.org>,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [dm-devel] [RESEND PATCH 00/11] Integrity Policy Enforcement
	LSM (IPE)
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 06, 2020 at 11:59:10AM -0700, Deven Bowers wrote:
>On Mon, Apr 06, 2020 at 08:50:46PM +0200, Jann Horn wrote:
>> On Mon, Apr 6, 2020 at 8:10 PM <deven.desai@linux.microsoft.com> wrote:
>> > Overview:
>> > ------------------------------------
>> > IPE is a Linux Security Module, which allows for a configurable
>> > policy to enforce integrity requirements on the whole system. It
>> > attempts to solve the issue of Code Integrity: that any code being
>> > executed (or files being read), are identical to the version that
>> > was built by a trusted source.
>>
>> Where's patch 02/11? lore at
>> https://lore.kernel.org/linux-security-module/20200406183619.GA77626@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net/T/#t
>> has everything other than that patch.
>
>It looks like it's over majordomo's character limit by 7489 characters.
>I'll have to repost with this patch broken up. Apologies.

Looks like it didn't cc LKML either.

-- 
Thanks,
Sasha


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C80C41AD66C
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 08:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587105866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Tx3qJvCWz4hmVLTvbKvn3hYrga7i/ZXXdE3cnOlQGY=;
	b=g/qmOYltU4YEuin45kvuu5Yc4kGbQkaSu5GwVRuRcPnxna7+9WjJELugxouGlEzhNkFfc1
	osCC0pwzU7Fv7NONeu5fWkYtzqjkk5AqOsOXMQvJsaTIJBeNwe/dPAOkByoOrv1T7cquRu
	aPKTe5EvEh842Lvb5MuDLOfZaloXdd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-GS3pRJEgP9KwvTJs30ep_w-1; Fri, 17 Apr 2020 02:44:23 -0400
X-MC-Unique: GS3pRJEgP9KwvTJs30ep_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B13A8010CA;
	Fri, 17 Apr 2020 06:44:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEEBB1036D20;
	Fri, 17 Apr 2020 06:44:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8100A18089C8;
	Fri, 17 Apr 2020 06:44:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03H0qChD016511 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 20:52:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD5B41006ECA; Fri, 17 Apr 2020 00:52:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9B801007273
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:52:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35898800296
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:52:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-387-X1wcNh9ENPSR8p8cPz-D_g-1;
	Thu, 16 Apr 2020 20:52:06 -0400
X-MC-Unique: X1wcNh9ENPSR8p8cPz-D_g-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6153720B4737;
	Thu, 16 Apr 2020 17:52:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6153720B4737
To: "Lev R. Oshvang ." <levonshe@gmail.com>,
	Stephen Smalley <stephen.smalley@gmail.com>
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
	<CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <e0e214c7-09d2-46c1-fe63-febd23488720@linux.microsoft.com>
Date: Thu, 16 Apr 2020 17:52:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03H0qChD016511
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 02:43:50 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com,
	SELinux <selinux@vger.kernel.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	James Morris <jmorris@namei.org>, chpebeni@linux.microsoft.com,
	dm-devel@redhat.com, suredd@microsoft.com,
	linux-integrity@vger.kernel.org, balajib@microsoft.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020-04-12 1:15 a.m., Lev R. Oshvang . wrote:
<snip>
> 
> It sees to me that  LKRG (kernel run time guard)  takes the role of
> measuring kernel structures.  Perhaps you need to consult with LKRG
Thanks Lev for the feedback. I will investigate more into it.
> guys.
> Lev.
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


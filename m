Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 502367AB5AF
	for <lists+dm-devel@lfdr.de>; Fri, 22 Sep 2023 18:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695399445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rkh3hN/TdY9nh5y6Zpq4ECXnHcRxKwD0LMDnpeEZQzM=;
	b=dP4v0wruAm1Gj+mHzIKT4mh3n5DkD9ICG5+fDBq5YllavXgKr04+C4BDr4+sd8qZFJklbt
	15h1k/D0XuMFhbwzZz5y/YeCabCCEMCovtFVuKkCbQ4Aog0fV+LPuEmPdLsKNOyni32Z8u
	Nfai8GmKvdu7T/wAaYz8bTD386tbzbg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-B9p_KNUxOV2uUsLo1-BSjw-1; Fri, 22 Sep 2023 12:17:21 -0400
X-MC-Unique: B9p_KNUxOV2uUsLo1-BSjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 089FD803516;
	Fri, 22 Sep 2023 16:17:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A1F710F1BE7;
	Fri, 22 Sep 2023 16:17:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07B8719466F8;
	Fri, 22 Sep 2023 16:17:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18C681946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 22 Sep 2023 16:17:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0294C20268D7; Fri, 22 Sep 2023 16:17:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE76D20268D4
 for <dm-devel@redhat.com>; Fri, 22 Sep 2023 16:17:03 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBE283827DE5
 for <dm-devel@redhat.com>; Fri, 22 Sep 2023 16:17:03 +0000 (UTC)
Received: from mail.ultracoder.org (188.227.94.15.ptspb.net [188.227.94.15])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-3wpBvo_mPdS0Jj54E-QGHQ-1; Fri,
 22 Sep 2023 12:17:01 -0400
X-MC-Unique: 3wpBvo_mPdS0Jj54E-QGHQ-1
Message-ID: <b8f8cc10-8081-afe4-738b-376a1248ec05@ultracoder.org>
Date: Fri, 22 Sep 2023 19:16:58 +0300
MIME-Version: 1.0
To: Mike Snitzer <snitzer@kernel.org>, Roman Mamedov <rm@romanrm.net>
References: <0e15b760-2d5f-f639-0fc7-eed67f8c385c@ultracoder.org>
 <ZQy5dClooWaZoS/N@redhat.com> <20230922030340.2eaa46bc@nvm>
From: Kirill Kirilenko <kirill@ultracoder.org>
In-Reply-To: <20230922030340.2eaa46bc@nvm>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] fstrim on raid1 LV with writemostly PV leads to
 system freeze
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-raid@vger.kernel.org, heinzm@redhat.com, dm-devel@redhat.com,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ultracoder.org
Content-Language: ru-RU, en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 22.09.2023 00:45 +0300, Mike Snitzer wrote:
> Given your use of 'writemostly' I'm inferring you're using lvm2's
> raid1 that uses MD raid1 code in terms of the dm-raid target.

Yes, exactly.

On 22.09.2023 00:45 +0300, Mike Snitzer wrote:
> All said: hopefully someone more MD oriented can review your report
> and help you further.
Thank you. I don't need to send a new report to MD maintainers, do I?

On 22.09.2023 01:03 +0300, Roman Mamedov wrote:
> Maybe your system hasn't frozen too, just taking its time in processing all
> the tiny split requests.
I don't think so, because the disk activity light is off. Let me clarify:
if music was playing when the system froze, the last sound buffer begins 
to play cyclically.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


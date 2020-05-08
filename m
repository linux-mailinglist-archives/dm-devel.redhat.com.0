Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6D59F1CD39E
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3bjWQfHoJ+3FUxY40TC3CPNlOJVcigvcnfsLBGhxKBo=;
	b=NxZ0egzrTI4YLAklZjSzw9UBTR+Yzge6pXWIi+NOtRDk9EbP+x51V4VSyUx8rc/sWq3Jor
	lM0UdSWHWDQRUcbtPfj+qxEOwVGpRnid0LALuKeVTEmlpRkn6KvSb92oSSWeQvWuw6m92O
	5rsEYSEX8ImAy994Hx8KYfzMzIG0cEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-WcmGXHkNNpm2AupznlLxxw-1; Mon, 11 May 2020 04:18:56 -0400
X-MC-Unique: WcmGXHkNNpm2AupznlLxxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970FC105250B;
	Mon, 11 May 2020 08:18:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29505707DE;
	Mon, 11 May 2020 08:18:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC27B4CAA0;
	Mon, 11 May 2020 08:18:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04816OXx006133 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 21:06:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB98610E4D1A; Fri,  8 May 2020 01:06:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7EBA10E4D16
	for <dm-devel@redhat.com>; Fri,  8 May 2020 01:06:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAEEA101A525
	for <dm-devel@redhat.com>; Fri,  8 May 2020 01:06:22 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-uMMN0CrWOlCTPETsQfmLZA-1; Thu, 07 May 2020 21:06:17 -0400
X-MC-Unique: uMMN0CrWOlCTPETsQfmLZA-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6BF86FCECC25D483787D;
	Fri,  8 May 2020 09:06:13 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.180) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 8 May 2020 09:06:09 +0800
To: Mike Snitzer <snitzer@redhat.com>
References: <1588854412-19301-1-git-send-email-zou_wei@huawei.com>
	<20200507142958.GA12032@redhat.com>
From: Samuel Zou <zou_wei@huawei.com>
Message-ID: <d945a16d-5a9d-252f-2dec-1d654c4f7e77@huawei.com>
Date: Fri, 8 May 2020 09:06:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507142958.GA12032@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.166.212.180]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04816OXx006133
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH -next] dm mpath: Remove unused variable ret
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hi Mike,

You are right.
I did not notice that the macro DMEMIT uses the sz variable.

Thanks.

On 2020/5/7 22:29, Mike Snitzer wrote:
> On Thu, May 07 2020 at  8:26am -0400,
> Samuel Zou <zou_wei@huawei.com> wrote:
> 
>> This patch fixes below warning reported by coccicheck:
>>
>> drivers/md/dm-historical-service-time.c:240:14-16: Unneeded variable: "sz". Return "0" on line 261
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> 
> Nack.
> 
> DMEMIT() uses the local sz variable.
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AD7DE260D83
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 10:24:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-9KOa4MqhOiGBCKVInJ-0nw-1; Tue, 08 Sep 2020 04:24:07 -0400
X-MC-Unique: 9KOa4MqhOiGBCKVInJ-0nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E74F18B9F0C;
	Tue,  8 Sep 2020 08:24:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B586927BD8;
	Tue,  8 Sep 2020 08:24:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62D4079FFA;
	Tue,  8 Sep 2020 08:23:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0888Mm7q014149 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 04:22:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D05882872; Tue,  8 Sep 2020 08:22:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088D0951A4
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:22:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A462618AE94A
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:22:45 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-523-nk4iHh54MemuIIybDTQR4Q-1; Tue, 08 Sep 2020 04:22:43 -0400
X-MC-Unique: nk4iHh54MemuIIybDTQR4Q-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id ED019FEDFFE4A090741A;
	Tue,  8 Sep 2020 16:22:39 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.232) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 8 Sep 2020 16:22:30 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
References: <a3672ace-9637-20e2-04ce-857e364ffdb3@huawei.com>
	<3878396a72f62bc724766d1a5f752c490b60c50d.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <bf3009e7-6172-b9eb-9434-b528cfbfe663@huawei.com>
Date: Tue, 8 Sep 2020 16:22:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3878396a72f62bc724766d1a5f752c490b60c50d.camel@suse.com>
X-Originating-IP: [10.174.179.232]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V2 00/14] multipath-tools series: some
 cleanups and fixes checked by codedex tool
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB



On 2020/9/8 16:15, Martin Wilck wrote:
> Hello lixiaokeng,
> 
> On Tue, 2020-09-08 at 14:50 +0800, lixiaokeng wrote:
>> Patches 01, 02, 04, 05, 06, 09, 11, 12, 14 have some changes.
> 
> I have problems applying your patches. It seems to me that the
> whitespace has been messed up by your mail program (tab indentation has
> been replaced by spaces).
> 
> The v1 series you sent was OK, but v2 is different.
> 
> Regards,
> Martin
> 
> 
 Hello Martin,

   I will check why it happens and send patches v3.

-Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


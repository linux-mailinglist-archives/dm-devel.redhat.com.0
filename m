Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 83AB425FA79
	for <lists+dm-devel@lfdr.de>; Mon,  7 Sep 2020 14:27:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-z8fh1K78M4idjef6-_olYg-1; Mon, 07 Sep 2020 08:27:30 -0400
X-MC-Unique: z8fh1K78M4idjef6-_olYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44788802B71;
	Mon,  7 Sep 2020 12:27:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E31D5C26B;
	Mon,  7 Sep 2020 12:27:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 472F579FE9;
	Mon,  7 Sep 2020 12:27:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087CREpV013046 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 08:27:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1ADB7100405E; Mon,  7 Sep 2020 12:27:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 154FE1111452
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 12:27:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0DB0811E79
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 12:27:10 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-336-Kp0NcYmjM2m8m0Ax3YjVBg-1; Mon, 07 Sep 2020 08:27:08 -0400
X-MC-Unique: Kp0NcYmjM2m8m0Ax3YjVBg-1
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 0685355F38712C16A229;
	Mon,  7 Sep 2020 20:27:04 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Sep 2020
	20:26:56 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<eeea4f08-bcb1-65b6-2fe8-b078961a07d3@huawei.com>
	<20200904235252.GG11108@octiron.msp.redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <b26b27f9-3c6e-8b9c-baa1-c72fd0cf7d96@huawei.com>
Date: Mon, 7 Sep 2020 20:26:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904235252.GG11108@octiron.msp.redhat.com>
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list, fails in handle_args func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB


>>
>> -		paramp= malloc(sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS )));
>> -
>> -		memset(paramp, 0, sizeof(struct prout_param_descriptor) + (sizeof(struct transportid *)*(MPATH_MX_TIDS)));
> 
> When looking at your patch, I noticed that this function has both
> num_transport and num_transportids, but only num_transport is used,
> while num_transportids is reported back to the user.  I realize that
> this is only tangentially related to your patch, but if you could
> combine these two varaiables, that would be helpful.
> 

Hi Ben:
  Thanks for you great advice. I will make patch v2 following your
advice.

-Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


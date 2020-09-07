Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAB6325FA64
	for <lists+dm-devel@lfdr.de>; Mon,  7 Sep 2020 14:22:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-2dwN-TLoOJO5rCB0sUXoqQ-1; Mon, 07 Sep 2020 08:22:10 -0400
X-MC-Unique: 2dwN-TLoOJO5rCB0sUXoqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C47FF10BBECD;
	Mon,  7 Sep 2020 12:22:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C62D60C0F;
	Mon,  7 Sep 2020 12:21:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EECB79FE9;
	Mon,  7 Sep 2020 12:21:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087CLmAv012606 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 08:21:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74A192166B44; Mon,  7 Sep 2020 12:21:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9AC2156A23
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 12:21:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C76FF80121F
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 12:21:45 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-501-xy5u5UM4O9Ohemr_hvTpQA-1; Mon, 07 Sep 2020 08:21:42 -0400
X-MC-Unique: xy5u5UM4O9Ohemr_hvTpQA-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D33CA58B3D134E957071;
	Mon,  7 Sep 2020 20:21:38 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Sep 2020
	20:21:29 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
	<20200904213048.GE11108@octiron.msp.redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <8dd72a70-991a-cb7d-3279-3d5036df1b9d@huawei.com>
Date: Mon, 7 Sep 2020 20:21:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904213048.GE11108@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 09/14] libmultipath: check whether
 mp->features is NULl in, assemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB


>> @@ -86,9 +86,12 @@ assemble_map (struct multipath * mp, char * params, int len)
>>  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
>>  		add_feature(&mp->features, retain_hwhandler);
>>
>> -	f = STRDUP(mp->features);
> 
> clearly strdup()ing without checking if mp->features NULL is incorrect.
> However, I'm not sure that we need to fail if mp->features is NULL.
> instead, int the APPEND call, we could use the gcc ternary operator
> extension
> 
> (mp->features)?: "0"
> 
> to use "0" if mp->features is NULL.
> 
> Also, have you seen this actually occur?  Or is this just a theoretical
> issue that you've found from reading the code.  It seems like
> setup_map() will always call select_features() before calling
> assemble_map(), which should mean that mp->features will always be set
> in this case. Perhaps I'm missing something here.
> 
> -Ben
> 
Hi Ben,
  This just a theoretical issue and I did not see it. But it's not necessary
to call strdup. In your opinion, need multipath be checked?  I will make new
patch with your suggestion.

-Lixiaokeng
>> +	if (!mp->features) {
>> +		condlog(0, "mp->features is still NULL.");
>> +		goto err;
>> +	}



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 48B7B30D685
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 10:45:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-2LztPI12OqK48QyDVMMbzw-1; Wed, 03 Feb 2021 04:45:19 -0500
X-MC-Unique: 2LztPI12OqK48QyDVMMbzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C19B1015C82;
	Wed,  3 Feb 2021 09:45:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B71D10016FA;
	Wed,  3 Feb 2021 09:45:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 805324EA31;
	Wed,  3 Feb 2021 09:45:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1139gq7v009472 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 04:42:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8BEECF00EB; Wed,  3 Feb 2021 09:42:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86827F1C92
	for <dm-devel@redhat.com>; Wed,  3 Feb 2021 09:42:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D47858EEB
	for <dm-devel@redhat.com>; Wed,  3 Feb 2021 09:42:50 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-voj0wZ-xOB2mION0dgARuw-1; Wed, 03 Feb 2021 04:42:45 -0500
X-MC-Unique: voj0wZ-xOB2mION0dgARuw-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DVxX21TRzz7g7D;
	Wed,  3 Feb 2021 17:41:22 +0800 (CST)
Received: from [10.174.178.113] (10.174.178.113) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.498.0; Wed, 3 Feb 2021 17:42:38 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>
References: <20210202195744.2384-1-mwilck@suse.com>
	<4c3bb639-b359-85a4-ea76-ba83347acd7c@huawei.com>
	<85a30ad88a76e01600aa0879f727da09debf0c42.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <6bafec0c-91e9-37cd-4c68-18f4175be51c@huawei.com>
Date: Wed, 3 Feb 2021 17:42:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <85a30ad88a76e01600aa0879f727da09debf0c42.camel@suse.com>
X-Originating-IP: [10.174.178.113]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: check if adopt_path() really
 added current path
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2021/2/3 16:14, Martin Wilck wrote:
> Is this also a Tested-by:? 
> IOW, did it fix your issue?

Yes, it solves the crash.But there is an other issue.

multipath.conf
defaults {
        find_multipaths no
}

[root@localhost coredump]# multipathd add path sdb
fail
[root@localhost coredump]# multipath -ll
[root@localhost coredump]# multipathd add path sdb
ok
[root@localhost coredump]# multipath -ll
0QEMU_QEMU_HARDDISK_drive-scsi0-0-0-1 dm-3 QEMU,QEMU HARDDISK
size=1.0G features='0' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=1 status=enabled
  `- 2:0:0:1 sdb 8:16 active ready running

I add local path twice. The first fails while the second
succeeds.

Regards,
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


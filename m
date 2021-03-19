Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D6E7234124A
	for <lists+dm-devel@lfdr.de>; Fri, 19 Mar 2021 02:50:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-0R9MTQHWNXOr12ttQlYYMA-1; Thu, 18 Mar 2021 21:50:13 -0400
X-MC-Unique: 0R9MTQHWNXOr12ttQlYYMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7F81009461;
	Fri, 19 Mar 2021 01:50:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4F6010027A5;
	Fri, 19 Mar 2021 01:50:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2C6C1809C83;
	Fri, 19 Mar 2021 01:49:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12J1ngwL009303 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Mar 2021 21:49:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1FAF2166BA3; Fri, 19 Mar 2021 01:49:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC9AF2166B44
	for <dm-devel@redhat.com>; Fri, 19 Mar 2021 01:49:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF004811E9B
	for <dm-devel@redhat.com>; Fri, 19 Mar 2021 01:49:39 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-398-FEzXT51DN0uenb-FRdO_1A-1; Thu, 18 Mar 2021 21:49:37 -0400
X-MC-Unique: FEzXT51DN0uenb-FRdO_1A-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F1mwX0KFZzmZSL;
	Fri, 19 Mar 2021 09:47:08 +0800 (CST)
Received: from [10.174.178.113] (10.174.178.113) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.498.0; Fri, 19 Mar 2021 09:49:27 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>
References: <20210128210852.23207-1-mwilck@suse.com>
	<c1dddccecfe0e12a2fe2dca66faad740a30acd53.camel@suse.com>
	<99488b1b-2339-338d-e951-0b8f3e78449b@huawei.com>
	<dcc6fb2a344ce75972242e2c78e2e485b58140da.camel@suse.com>
	<655de0b3-9625-bf3c-85f8-d19832bd84d8@huawei.com>
	<79f18cdb19b41be24d082d5528ab2325e6552395.camel@suse.com>
	<05c23ce9-4859-b0c3-3acb-c74f2c4510d6@huawei.com>
	<41e79d67f568baf8de6b28e4924620240f0a2731.camel@suse.com>
	<58a88880-8977-7439-86d6-898d8a2b4bed@huawei.com>
	<0e3dbb9a0890cca8145fff576b79125c89601689.camel@suse.com>
	<4e562d96acc1b52abc2f2e502872cb2871469465.camel@suse.com>
	<580f3fc1-2035-21cb-3b63-28ff7c48b8af@huawei.com>
	<4eed40b903d55714212bb629600aed452f980e62.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <6306ea67-cd4a-a507-a206-629cf5dadf0a@huawei.com>
Date: Fri, 19 Mar 2021 09:49:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4eed40b903d55714212bb629600aed452f980e62.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12J1ngwL009303
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: avoid crash in uevent_cleanup()
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
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable



On 2021/3/18 0:59, Martin Wilck wrote:
> Hello Lixiaokeng,
>=20
>=20
>> Hi Martin
>>
>> =A0 I'm sorry for missing this. 38ffd89 ("libmultipath: prevent
>> DSO unloading with astray checker threads") fixes my issue.
>=20
> Thanks! Am I right assuming that you did _not_ use my prior patch
> "multipathd: avoid crash in uevent_cleanup()" (which would mean that we
> don't need it)? Please confirm that, too.
>=20

The patch "multipathd: avoid crash in uevent_cleanup()" is _NOT_ used.

Regards,
Lixiaokeng


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


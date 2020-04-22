Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3821B6F61
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 09:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587714546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=sx2KkwLUCio4yVHLbJmtPM7aeW/nC6lIp9a4FEGT6ow=;
	b=QX6QouDUGBDOsHmP226iTu7+vcuRPxXEcdk1v6yY1ecMieYweIQWJVeQdPAoZGAuj4KwED
	Ne0fXgGyX8QW2W5ynxRzUZ6jEg95CTgeB8PHgBjTTSPoe0/4LutrsZzElIlCglsFMHJ6el
	Y+28ufWxfekGnu+tBbalijJ2Rns3Rj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-5DAEsimZPK6FY1b9KU40Vg-1; Fri, 24 Apr 2020 03:49:00 -0400
X-MC-Unique: 5DAEsimZPK6FY1b9KU40Vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 562E0461;
	Fri, 24 Apr 2020 07:48:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C23DB25278;
	Fri, 24 Apr 2020 07:48:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA89B4CAA7;
	Fri, 24 Apr 2020 07:48:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MGtQKt023444 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 12:55:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 644FA2166B29; Wed, 22 Apr 2020 16:55:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 607582166B27
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 16:55:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA8C7101A55D
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 16:55:23 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-227-fh0F8vTmNv6bjLGK-OGjew-1;
	Wed, 22 Apr 2020 12:55:21 -0400
X-MC-Unique: fh0F8vTmNv6bjLGK-OGjew-1
X-YMail-OSG: EGlbyDMVM1krSWiLV84qYvNn2PhvDqfaAN.XwHP.6TfWi9.xEwug5NW5ECeAXnh
	NQF2JxNWiva6UblENM70pJ7i5xAhzvRaGEtXYJu5PEdj5IcjLUVsLmuNNb2WIM7T6oIjZeDdv.R.
	1vGZMgDVre3al0xO.wZpprnO5MSWBlEYke5R0ABTZmmnSxc89G.NA9H3gAa9PzYLBTisKtnIw51w
	go3ootV5EnOdlgvrIXa6fYyRKhfEoAUPeVPTnLiwg.cF0OvuOFeHfcTQkdthKu.5HKjfik0seAh8
	2yp3ii4Kl.1lbxRkReLGTnlkLuHU3WXnsiC.05i5WScgwufCO5pKvYClLPT4zE1Om3DknCrydcHy
	._8bfQQ1ItgIfU03gXt8wGAioaV.peN.vRMEk6epdntPTvGN5uWarVgprGR4ReRztfeSgZn_gwds
	h8TdJ8NveKvPKSQ99KLUeACrJI7NpbbNG3sAhcbhBk9fbhrhZVRa744pfyB.6ZQAAuTv8WE609Wi
	TrguyNa4Q1AUlSykI1Ph4rL18vqjBoRp8T2OpjmeKOfwrPfu2UwBcaqveWXZY8sr1uxc1tfpp_xX
	wMbHt9EwKVw8RMExQX23EqNYJ61ZoHQV5e_GyLKiCyckZcu2ESNeajDT4pz3F8wQyomzFzoBhOXk
	mamBs_BVYlliquyjXt89eaY2lBcXiYCE58f30JHeZJG1yudG_UzD.Doz6Z6ZHG6bZV5Vfa_BVoCp
	J5V3Oa2S27WNAqjR7c7ZdBYvs8VzfupRNwU2BZ_itUj57H5CLgGx9onqQKBOqXaHDYaPLgfHA32U
	lzRMdEZG5GvvZk5QJQmSZwBrFgv5iL4_4ECNnYavITeb_ERbeiAnytm.01I2Aw2H4FMDPBcTvZoe
	wA8TP0coxMdBgbb5LZxId.RnaJyZ_jMVqPJOiOOx0UkGRaSmNeC7kiNgmvKom5Ob5CYwypb8m4i6
	W8NZO6d51aToA6m1IAe8ERflsN06ArlGJzxMT1OBnlsOHI54VuDpFz4DF29kDzsUrVFzSPiUHUD5
	LeNA3kDZV5SttZ81lLKzMrMB5Lf9Le2df.O.TN36PWUwH2.VSIpJU_M0ko98Ppvq0fXbxLgU33R0
	nnoUb.HQJBiAkerQWcDYw6xxE2CxTq9Vnyk5qaIrtbhwCd1Ol2mRG8zmvjr0WoQKnc8OjHmjA2lp
	28IZX7hy1zcCz0XfXr0Kx1kJ02WEQYlyF85BmeKCZlRW4eBqGGWqECYcm6BlW6DNqP6lhRvkzf4S
	oyZcNlMY.hOj3cqarcqXuAGa5NaeqStyw9pQz1Gq5tvbkUqs87WznAYIxf6QTEA2IYhhduH2wKnq
	Qyg6hLcuH_DIG092mY9c9fSTIgiDO3r13xHmEug3rdegH6PlCz2UXgpx8CQ_GuOaSz0VXWiyjnYF
	87U4woQgvI4YtgKzSLEEBg._tlVHyJpvtMzY1FuCu5q69wlFGmjCtEnaV8RestXnqqw--
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 22 Apr 2020 16:55:20 +0000
Received: by smtp429.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 8277937103418b12203f17b293a6facc; 
	Wed, 22 Apr 2020 16:55:16 +0000 (UTC)
To: James Morris <jmorris@namei.org>, deven.desai@linux.microsoft.com
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<20200415162550.2324-6-deven.desai@linux.microsoft.com>
	<alpine.LRH.2.21.2004230234420.12318@namei.org>
From: Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <ff87e1ff-b9bf-5879-0154-c72990ce608b@schaufler-ca.com>
Date: Wed, 22 Apr 2020 09:55:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2004230234420.12318@namei.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MGtQKt023444
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 Apr 2020 03:48:26 -0400
Cc: snitzer@redhat.com, zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, sashal@kernel.org,
	Jonathan Corbet <corbet@lwn.net>, mdsakib@linux.microsoft.com,
	nramas@linux.microsoft.com, Stephen Smalley <sds@tycho.nsa.gov>,
	"Serge E. Hallyn" <serge@hallyn.com>, pasha.tatashin@soleen.com,
	jannh@google.com, linux-block@vger.kernel.org, axboe@kernel.dk,
	John Johansen <john.johansen@canonical.com>,
	Chad Sellers <csellers@tresys.com>, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Casey Schaufler <casey@schaufler-ca.com>, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v3 05/12] fs: add security blob and hooks
 for block_device
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/22/2020 9:42 AM, James Morris wrote:
> On Wed, 15 Apr 2020, deven.desai@linux.microsoft.com wrote:
>
>> From: Deven Bowers <deven.desai@linux.microsoft.com>
>>
>> Add a security blob and associated allocation, deallocation and set hooks
>> for a block_device structure.
>>
>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Is there any feedback from block or LSM folk on the addition of a security 
> blob for block_device here?

The addition of a blob looks to have been done correctly.
As for it's use, I haven't had the chance to review the patches that
use it. I didn't see a patch that implements the hooks in a LSM,
but that could just be me. 

>
> IPE uses this is to track the status of integrity verification of e.g. 
> DM-Verity devices, per this code from a subsequent patch:
>
>
> +       ret = security_bdev_setsecurity(dm_table_get_md(v->ti->table)->bdev,
> +                                       DM_VERITY_SIGNATURE_SEC_NAME,
> +                                       v->sig->sig, v->sig->sig_size);
>
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


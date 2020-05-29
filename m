Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC291E7C30
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 13:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590752762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LH4FwapT9l79TP2p1dq3ldjlButMouPUb7jE2vl12Ro=;
	b=V4szfMnViZ5ILsC4I3wFjEK7nkn5lPyTGeOayFWct07gsH3N4Rxl8gQgh2bKowOUKLJ/8y
	AfwABz9vyx9l/aW/scyvDEQVCiM85h5QtvFxHonvUFt7Z7dq9wA/iO/pK99airxH87NxoU
	CJMXZ+9zlZUiM8RVZwfEUKMHpH1bRAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-xkesBi1xPNSdX4ZTp2CeOw-1; Fri, 29 May 2020 07:45:59 -0400
X-MC-Unique: xkesBi1xPNSdX4ZTp2CeOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 397BB107ACCA;
	Fri, 29 May 2020 11:45:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B5D01001B07;
	Fri, 29 May 2020 11:45:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF96C1809541;
	Fri, 29 May 2020 11:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TBjM3B004462 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 07:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3E28101B542; Fri, 29 May 2020 11:45:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86B12101B549
	for <dm-devel@redhat.com>; Fri, 29 May 2020 11:45:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 092D91049842
	for <dm-devel@redhat.com>; Fri, 29 May 2020 11:45:17 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-445-bm_QKHsUN863sc3U8BptTg-1; Fri, 29 May 2020 07:45:12 -0400
X-MC-Unique: bm_QKHsUN863sc3U8BptTg-1
Received: by mail-wm1-f65.google.com with SMTP id f5so3102086wmh.2;
	Fri, 29 May 2020 04:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4x/Y1EbdE/VBFugQq96IytTzq2gb9yRkZWI1/dgyL7I=;
	b=BX+r5LHVEsV4K5mvVvLBsxBWLrVo4dt4UNOO7lbDUQAwIJ8nWVnvn87nviSqW9IECe
	d5P5vEZhIY5Ap8oJfoT0itBQm3TayDZnDbnhmiLKhrYKYySgC3ldR7gEEucuttZGwxAQ
	TS4JMtYH4QqEOBjUsRQ27tlC+LlorKZFcTBJWkHX/ugGm2vwo10m4+vtRVqy5+O5FpQY
	xSZN7ELvkHDT3nHD/m5VCH+PyF5FrOIAHoomWWkruvKeajyCGBDs6eKC0eLoEAOm9RhD
	Dq2WZaNzzhXkA88VyNf5mFrGkKhZCI02Vxlp+Bmw7pnGaZ5a9KRp1e9eaxAbCyiyds9Z
	nhcQ==
X-Gm-Message-State: AOAM531JNYLLZ3pbIRp6kacFhYWbxMe80ACknFSNcO8YNS1iDOFw6m4x
	UOLULDtVQtV0mfA7vAPtIQ==
X-Google-Smtp-Source: ABdhPJxtJcRM8+Gl0Z9GIy8YZQ1icF6fRHjZ4QkBHtcn9TtXNUJiB3qotrlqe+/E5C3LQ6nC6Iu6dA==
X-Received: by 2002:a1c:5a82:: with SMTP id o124mr8037779wmb.188.1590752711414;
	Fri, 29 May 2020 04:45:11 -0700 (PDT)
Received: from localhost (169.red-83-33-155.dynamicip.rima-tde.net.
	[83.33.155.169]) by smtp.gmail.com with ESMTPSA id
	k17sm8515441wrl.54.2020.05.29.04.45.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 29 May 2020 04:45:10 -0700 (PDT)
To: Martin Wilck <Martin.Wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
References: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
	<1590725443-3519-2-git-send-email-bmarzins@redhat.com>
	<d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <42eef647-d9ef-7956-5852-27188bc4665f@gmail.com>
Date: Fri, 29 May 2020 13:45:09 +0200
MIME-Version: 1.0
In-Reply-To: <d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: "mail@eworm.de" <mail@eworm.de>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"besser82@fedoraproject.org" <besser82@fedoraproject.org>,
	Eric Haszlakiewicz <erh+git@nimenees.com>
Subject: Re: [dm-devel] [PATCH 1/1] libdmmp: Add support for upcoming json-c
	0.14.0.
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
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable

On 5/29/20 11:12 AM, Martin Wilck wrote:

> On Thu, 2020-05-28 at 23:10 -0500, Benjamin Marzinski wrote:
>> From: Bj=C3=B6rn Esser <besser82@fedoraproject.org>
>>
>> TRUE/FALSE are not defined anymore.  1 and 0 are used instead.
>> This is backwards compatible, as earlier versions of json-c are
>> using the same integer values in their present definitions.
>>
>> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>> ---
>>   libdmmp/libdmmp_private.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
>> index ac85b63f..4378962b 100644
>> --- a/libdmmp/libdmmp_private.h
>> +++ b/libdmmp/libdmmp_private.h
>> @@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx,
>> const char *var_name) { \
>>   do { \
>>   =09json_type j_type =3D json_type_null; \
>>   =09json_object *j_obj_tmp =3D NULL; \
>> -=09if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) !=3D TRUE)
>> { \
>> +=09if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) !=3D 1) { \
>>   =09=09_error(ctx, "Invalid JSON output from multipathd IPC: "
>> \
>>   =09=09       "key '%s' not found", key); \
>>   =09=09rc =3D DMMP_ERR_IPC_ERROR; \
>=20
> Did you see
> https://www.redhat.com/archives/dm-devel/2020-May/msg00261.html ?
>=20
> This has first been reported to the list by Christian (
> https://www.redhat.com/archives/dm-devel/2020-April/msg00261.html), and
> brought to my attention later by Xose. I personally thought the change
> from boolean to int is a step in the wrong direction, therefore I
> submitted my modified version using stdboolh. If everyone else is fine
> with the int, it's not worth arguing about it.
>=20
> Regards,
> Martin
>=20
> PS: Can anyone explain why json-c did this? Looks like a "cause hassle
> for downstream devs and users for no good reason" kind of thing to
> me...
>=20

Add Eric Haszlakiewicz to CC.

Done at: https://github.com/json-c/json-c/commit/0992aac61f8b087efd7094e9ac=
2b84fa9c040fcd

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


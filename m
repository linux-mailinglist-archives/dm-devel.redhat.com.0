Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF771E9FFD
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 10:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590999974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yxce01aVvsHn97sVpPISGB3O7IkdLjQnvmkAu9+C35o=;
	b=IAx4m00izwmnE/G6XYKRtCBdxO+kjjBnRJH/rqSDXu7YV87TDpQ2TUuFHE/bbRDh4hkug1
	FJ/xtFVJOGxqR4AMR8dfMhSbENp+hflZd7Xb6HdnmZH24lb0sasVIdPz4SdjuArK/FRt0S
	e5WIXza2ly5Y5r/lfr24BfmaY3SFwHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-AYAMqPDGO-ywFgR27R4t8A-1; Mon, 01 Jun 2020 04:26:11 -0400
X-MC-Unique: AYAMqPDGO-ywFgR27R4t8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70576835B8B;
	Mon,  1 Jun 2020 08:26:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5EC5D9CA;
	Mon,  1 Jun 2020 08:26:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7524A1809543;
	Mon,  1 Jun 2020 08:25:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04UEXJnp027204 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 30 May 2020 10:33:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BBCE101F0B3; Sat, 30 May 2020 14:33:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DF1101F0A4
	for <dm-devel@redhat.com>; Sat, 30 May 2020 14:33:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 510038007C8
	for <dm-devel@redhat.com>; Sat, 30 May 2020 14:33:16 +0000 (UTC)
Received: from ophelia.nimenees.com (lucy.nimenees.com [54.200.72.234])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-310-unbgWc3mPaGLPl34TQg1OQ-1; Sat, 30 May 2020 10:33:13 -0400
X-MC-Unique: unbgWc3mPaGLPl34TQg1OQ-1
Received: from [192.168.1.10] (pool-96-250-56-9.nycmny.fios.verizon.net
	[96.250.56.9])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ophelia.nimenees.com (Postfix) with ESMTPSA id 4C18C46966;
	Sat, 30 May 2020 14:25:35 +0000 (UTC)
To: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <Martin.Wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
References: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
	<1590725443-3519-2-git-send-email-bmarzins@redhat.com>
	<d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
	<42eef647-d9ef-7956-5852-27188bc4665f@gmail.com>
From: Eric Hawicz <erh@nimenees.com>
Message-ID: <cd7e550b-cc5e-ca1a-e092-f5ffcbb16d70@nimenees.com>
Date: Sat, 30 May 2020 10:25:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <42eef647-d9ef-7956-5852-27188bc4665f@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04UEXJnp027204
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jun 2020 04:25:39 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable

On 5/29/2020 7:45 AM, Xose Vazquez Perez wrote:
> On 5/29/20 11:12 AM, Martin Wilck wrote:
>
>> Did you see
>> https://www.redhat.com/archives/dm-devel/2020-May/msg00261.html ?
>>
>> This has first been reported to the list by Christian (
>> https://www.redhat.com/archives/dm-devel/2020-April/msg00261.html), and
>> brought to my attention later by Xose. I personally thought the change
>> from boolean to int is a step in the wrong direction, therefore I
>> submitted my modified version using stdboolh. If everyone else is fine
>> with the int, it's not worth arguing about it.
>>
>> Regards,
>> Martin
>>
>> PS: Can anyone explain why json-c did this? Looks like a "cause hassle
>> for downstream devs and users for no good reason" kind of thing to
>> me...
>>
>
> Add Eric Haszlakiewicz to CC.
>
> Done at:=20
> https://github.com/json-c/json-c/commit/0992aac61f8b087efd7094e9ac2b84fa9=
c040fcd


TRUE and FALSE are rather generic defines that json-c had no business=20
ever setting, especially to json-c specific values, and the fact that we=20
were doing so was conflicting with other cases that already defined it.=A0=
=20
Sorry about the hassle, but I consider that a very good reason to remove=20
them.


Eric


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 76448F3959
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 21:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573157812;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/bgqfkZO8aqBZF/I6w7pSAtZUF14pO2T3+2uRwOyTOE=;
	b=SDHqQ9B69fNizIfH7PBtxlEecVTTT0iR/YBZEqonWLzvUw3XtaIiZLiQQuWCKr9gRTjAPk
	1VHiWherDh22Ik87AraBIAroPLsoqAlcZ0fVuslRrYmI67B3rRIOleAbJna2BuzvodTJsZ
	LHN6vciaShpXMlTMBA4vILd/1XAvgiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-clcx51fAN5WW3CCmpML0QQ-1; Thu, 07 Nov 2019 15:16:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 878831005500;
	Thu,  7 Nov 2019 20:16:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31788600D3;
	Thu,  7 Nov 2019 20:16:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A1324BB65;
	Thu,  7 Nov 2019 20:16:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7KGP06016524 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 15:16:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A206E5D6B7; Thu,  7 Nov 2019 20:16:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.40.205.22] (unknown [10.40.205.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2933C5D70E;
	Thu,  7 Nov 2019 20:16:19 +0000 (UTC)
To: Mikulas Patocka <mpatocka@redhat.com>, Maged Mokhtar <mmokhtar@petasan.org>
References: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
	<8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
	<20191106150831.GA27888@redhat.com>
	<5370f009-c324-1530-4400-adf1b59f0bbd@petasan.org>
	<20191107190958.GA2821@redhat.com>
	<cba8f93a-3477-9c87-0bff-fe7e6962d606@petasan.org>
	<alpine.LRH.2.02.1911071448290.20334@file01.intranet.prod.int.rdu2.redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <0fe12edd-c959-a870-0e15-988209cd629a@redhat.com>
Date: Thu, 7 Nov 2019 21:16:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911071448290.20334@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] dm-writecache: change config parameters using
	messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: clcx51fAN5WW3CCmpML0QQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Dne 07. 11. 19 v 20:50 Mikulas Patocka napsal(a):
>=20
>=20
> On Thu, 7 Nov 2019, Maged Mokhtar wrote:
>=20
>>
>>
>> On 07/11/2019 21:09, Mike Snitzer wrote:
>>> On Thu, Nov 07 2019 at  1:55pm -0500,
>>> Maged Mokhtar <mmokhtar@petasan.org> wrote:
>>>
>>>>
>>>>
>>>> On 06/11/2019 17:08, Mike Snitzer wrote:
>>>>> On Tue, Nov 05 2019 at  4:19pm -0500,
>>>>> Maged Mokhtar <mmokhtar@petasan.org> wrote:
>>>>>
>>>>>> Gentle ping please.
>>>>>>
>>>>>> It could add flexibility in changing cache parameters after device
>>>>>> creation.
>>>>>
>>>>> I'm inclined to _not_ take this type of change.
>>>>>
>>>>> Why isn't changing the config parameters via table reload viable for
>>>>> you?
>>>>>
>>>>
>>

IMHO any target update that is changing behavior of target should be made v=
ia=20
table reload - typical symptom of such requirement is - that change may
requires some memory allocation, metadata updates, synchronization of data =
on=20
used disks...

If these things are made via messages - there is 'no simply way' back
(while with table reload - we drop table if 'suspend' cannot proceed).

Another problem is - that if change is not visible via 'table line',
future table access might be unaware of the change  and may reload
table and expect different behavior.

Also actual table update via  suspend & resume cannot be much slower then=
=20
message anyway - you can use 'noflush' if you need to - depending on the
situation it might be usable -  and such operation is very quick.

Regards

Zdenek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


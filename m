Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4E427BE7B
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-crx_PrzDP7KNWtL8REg-aA-1; Tue, 29 Sep 2020 03:55:36 -0400
X-MC-Unique: crx_PrzDP7KNWtL8REg-aA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFAE31084D86;
	Tue, 29 Sep 2020 07:55:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85CAC5D9DC;
	Tue, 29 Sep 2020 07:55:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BDE9181A06C;
	Tue, 29 Sep 2020 07:55:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SJDiwh010697 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 15:13:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3DC8202279B; Mon, 28 Sep 2020 19:13:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5322028DCC
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 19:13:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 579E28582A9
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 19:13:42 +0000 (UTC)
Received: from EUR06-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur06olkn2051.outbound.protection.outlook.com [40.92.51.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-506-4Vp1mz2uOuyFWl66fblgKA-1; Mon, 28 Sep 2020 15:13:39 -0400
X-MC-Unique: 4Vp1mz2uOuyFWl66fblgKA-1
Received: from AM7EUR06FT066.eop-eur06.prod.protection.outlook.com
	(2a01:111:e400:fc36::52) by
	AM7EUR06HT153.eop-eur06.prod.protection.outlook.com
	(2a01:111:e400:fc36::74) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21;
	Mon, 28 Sep 2020 19:13:37 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:fc36::44) by AM7EUR06FT066.mail.protection.outlook.com
	(2a01:111:e400:fc36::475) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via
	Frontend Transport; Mon, 28 Sep 2020 19:13:37 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:555FCD4BF43B6ED7EC9C6CD20F73D73ED255740EB93088791F3EF929BA5F9414;
	UpperCasedChecksum:F06E3FF3290AA5B019CA23B1017681560D257D876FCFCC65BDE7010F6678652D;
	SizeAsReceived:8149; Count:49
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.029;
	Mon, 28 Sep 2020 19:13:37 +0000
To: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com
References: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<AM0PR09MB2897B99544634CA56DA930D1FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<bb1c3bce184dae7dc6148417aae115a87658a28c.camel@suse.com>
From: Frank Meinl <frank.meinl@live.de>
Message-ID: <AM0PR09MB289751B64BA29C2B7C307984FE350@AM0PR09MB2897.eurprd09.prod.outlook.com>
Date: Mon, 28 Sep 2020 21:13:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
In-Reply-To: <bb1c3bce184dae7dc6148417aae115a87658a28c.camel@suse.com>
X-ClientProxiedBy: AM3PR07CA0143.eurprd07.prod.outlook.com
	(2603:10a6:207:8::29) To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <b7330177-8c5c-cdfb-8393-51c4c2994a0d@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8070:a196:3b00:5cc6:6fdf:b734:3923]
	(2a02:8070:a196:3b00:5cc6:6fdf:b734:3923) by
	AM3PR07CA0143.eurprd07.prod.outlook.com (2603:10a6:207:8::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.14
	via Frontend Transport; Mon, 28 Sep 2020 19:13:37 +0000
X-Microsoft-Original-Message-ID: <b7330177-8c5c-cdfb-8393-51c4c2994a0d@live.de>
X-TMN: [9oKCuZOhBLiqpsMSO2FIjkaFSf1g1ONuzy8dflv7fv8QLjdS6+zcEqt5/8qbWrPiMWbR2ZYVLnQ=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 918007ec-193b-4c79-8f96-08d863e29a20
X-MS-TrafficTypeDiagnostic: AM7EUR06HT153:
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: CrK4RNoyh/tquCOie4a1pLIh29DWu9a3n+1mUmuv9KRlT5NQ7FmfuK+BL0XUGWPf2g4CwaWLr86srW778j3bqRb6YLyVfYoum2kpp0tW3e5B1KKrLa2zok7YxJNcjiL9Cebx7WxcEQTHMDui8NlHsgeKmeQhsbwYXzRFwDvPQ4wSoE8M0ScvkqPI+xQ1RXhef9yVf4l+wFMeXPxvr5qYMQx2koijz/mH789NJPO1GyHhOSunnqwz79QgsUqTQWvw
X-MS-Exchange-AntiSpam-MessageData: 1tA8JFXsyTtS80AnNnICa6pEygtb/MXo9C3xRfYIr+s+Ip3BRSmTWHeDtueKWOpjHOexGYkDSANPCU/Yvq4IhkndiPTRLA45JFRTZG+QX0SVMi9wNekVA3xVD34iiZXrlT7m7SfQvpSS8TQE/5tKwr2i+pvCtSbNZrBVy66JxVZ/WbmWBMElZjWtSRdu3YOPTE9apTyVfEXxdknnfQAagQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918007ec-193b-4c79-8f96-08d863e29a20
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 19:13:37.4498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR06FT066.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT153
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Subject: Re: [dm-devel] [PATCH v2 2/2] multipath: Extend program description
	in manpage
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26.09.20 21:02, Martin Wilck wrote:
> On Sat, 2020-09-26 at 18:29 +0200, Frank Meinl wrote:
>> Add two paragraphs which list some advantages of multipath and
>> explain
>> the benefit for single path devices. The text has been partly
>> composed
>> by Benjamin Marzinski. - Refer to
>> https://www.redhat.com/archives/dm-devel/2020-September/msg00431.html
>>
>> Signed-off-by: Frank Meinl <frank.meinl@live.de>
> 
> Hm, this was not what I meant. multipath(8) is not the man page of the
> dm-multipath kernel feature, it's the man page of the tool "multipath".
> USB disks could just as well be set up using "multipathd". This text is
> too generic and doesn't fit into multipath(8), neither generally nor
> wrt style.
> 
> We don't have a man page about dm-multipath itself, and as nobody has
> asked for it in 15 years, perhaps it's a bit late now to start one.
> 
> I know I asked you to do this, but thinking about it now, if you don't
> mind, let's just leave it at the first patch.
> 
> Regards
> Martin
> 
> 

No problem,
For me it's perfectly fine to ignore this patch. Maybe I was the wrong
person for this job, as I'm practically new to multipath.

Anyhow, if somebody else wants to use this text snippet in a more
appropriate place, please feel free.

  Frank

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


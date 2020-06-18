Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB431FFCDE
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 22:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592513084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DcFffXyvmmvE9NHYKqomIYuyXnukWJiBs9BrveVtxck=;
	b=gfpjaBhy7BZmgIKJAfYrlytp2LqAzrLHorptsLWSX9JMYqpBoz4644toziKYqpV2X46TEa
	IIWKLspocLEd/LKpN9saySv3fdQ8jEBLhRJrHgh1qSiH7/h+UIpFqVK9o+V64gc2nh47nA
	r6WirEYjUp42TH59aUj0+JPfrsgxDQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-FRAegk0tMme_AMV5WwbzQw-1; Thu, 18 Jun 2020 16:44:41 -0400
X-MC-Unique: FRAegk0tMme_AMV5WwbzQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9479872FE0;
	Thu, 18 Jun 2020 20:44:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8B55D9C5;
	Thu, 18 Jun 2020 20:44:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15D8C1809547;
	Thu, 18 Jun 2020 20:44:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IKiPKC030992 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 16:44:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16AFC2029F62; Thu, 18 Jun 2020 20:44:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1158F20267F2
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:44:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2AF6801020
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:44:19 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-DPQFEOJDMDStGTj6FEwKEQ-1; Thu, 18 Jun 2020 16:44:12 -0400
X-MC-Unique: DPQFEOJDMDStGTj6FEwKEQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB5881.eurprd04.prod.outlook.com (2603:10a6:10:a7::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19;
	Thu, 18 Jun 2020 20:44:10 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 20:44:10 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 7/7] multipath: add option to skip multipathd delegation
Thread-Index: AQHWRQbeo72nvcoV70qbq+/2YHHcUaje2GCA
Date: Thu, 18 Jun 2020 20:44:10 +0000
Message-ID: <05515ff45562db8013db838cd13bdb1f106f1e87.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-8-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50282165-8698-4c57-490a-08d813c85a7f
x-ms-traffictypediagnostic: DB8PR04MB5881:
x-microsoft-antispam-prvs: <DB8PR04MB588105254100B9334230572FFC9B0@DB8PR04MB5881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sRI8Q6cntuduRRiv7W5ztK3dboYCc9XEb40ijZ/Be4FSc0reIGSUIU79SZ07MGyD6BhZCzw8D504fHMxLVFDJT8ve4jtaSq5MG/uuGKXsvTK/jMAG2P50iNR2YwTPNB/d383lx3szuwtgBzdmEjZ0BNaVMq/ItSoDSnp1V2rnIwzcAFy26VQpItwYH8Y+1TN5KT9F9givCSd+1waU6+PR0mykWTPG1Gig1TniPyJgH4FIUOL/kXzaWTHjgx91NkhpHq+G1/Pss0mVXblKChH0IKmvm2MgimDxRZWN40RKQseoMnV7vU5hp2MOC/uH5W+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(316002)(508600001)(4326008)(76116006)(8676002)(66446008)(2616005)(4744005)(6506007)(6486002)(91956017)(6512007)(66556008)(36756003)(110136005)(66476007)(66946007)(64756008)(8936002)(5660300002)(186003)(2906002)(86362001)(83380400001)(26005)(71200400001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: EyKABWYzAD51azBnw/x1ULhfJQAwi+yHcS/ztsd2rkZpzD0g5frzytA1zSttP3s6IggRHuFTCe/QJ1O09W+88pdS94jqS1FSEq9Xcc8GykBCfEROOLiIA/u2fB/OiWilhUg0fWv1e0EwWRAwh1DsPukIDeI3GdOihra24wBCJgs/mudTgoWu+6LxZV2V1H2cJhMa8WdZw3saxSAGpXA2oHJjkM/AU5av6RK+cW89KQZh2oO3q0HCSb0IlUajS4tblppKQmEEPY11xlKPXl/F7FzPPe+dGFuEXzalwXoP3zDK2/ITsi8CElzGNj8aoTkhV7GsSDovY16FTssPt6ZJCEFQl1wCTSO04Qna0pK/BWA5NG58WvOwd8jBE8r+2P49Dyi/7+7/INysdQgb/e4dcGxnDKbKcdBL5jqoXQAKkP82jfHoOMi36FV7orf9FoBUVpeFYO87BeTINJlKrn/w/aQL0SlMTEIO0vokJG2ZiBY=
x-ms-exchange-transport-forked: True
Content-ID: <1AEDEF2939421746B941947F10A0E3AB@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50282165-8698-4c57-490a-08d813c85a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:44:10.4454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /80WTjRKi8rHtnGQePsyv00mFId+8Gi5mipUzYg5LrASf9ErMbG0k7hsnjXoHy1+h4YrTpVde23aXpyCBOV5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5881
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IKiPKC030992
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 7/7] multipath: add option to skip multipathd
	delegation
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> Add the -D option to allow users to skip delegating commands to
> multipathd.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.h |  1 +
>  multipath/main.c      | 15 +++++++++++----
>  multipath/multipath.8 | 16 +++++++++++-----
>  3 files changed, 23 insertions(+), 9 deletions(-)
>=20

I wonder if we really need this. We fall back to NOT_DELEGATED anyway.
If users really, really want this, they can run multipath while
multipathd is stopped.

I'm not saying it's totally useless, but the presence of this option
suggests to users that they may want to use it, which I doubt.
Perhaps we want to have it, for debugging or expert usage purpose, as a
hidden/undocumented option?

Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


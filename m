Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 253592778EB
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 21:04:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-uZWq-9BEOGW9Ebmqo-1GWQ-1; Thu, 24 Sep 2020 15:04:16 -0400
X-MC-Unique: uZWq-9BEOGW9Ebmqo-1GWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B22801AC8;
	Thu, 24 Sep 2020 19:04:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF955D9D2;
	Thu, 24 Sep 2020 19:04:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 007741826D2E;
	Thu, 24 Sep 2020 19:04:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OJ44nW002025 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 15:04:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C061115D96; Thu, 24 Sep 2020 19:04:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 351F8115DF9
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 19:04:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C702D18AE948
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 19:04:01 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-462-CYlHHvkAM3enzyaqWCpWuA-1;
	Thu, 24 Sep 2020 15:03:59 -0400
X-MC-Unique: CYlHHvkAM3enzyaqWCpWuA-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-12-zNRTUo5jM4-j_RVHnFQehA-1; Thu, 24 Sep 2020 21:03:56 +0200
X-MC-Unique: zNRTUo5jM4-j_RVHnFQehA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22;
	Thu, 24 Sep 2020 19:03:55 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.027;
	Thu, 24 Sep 2020 19:03:54 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [RFC PATCH v2 3/3] libmultipath: change log level for null
	uid_attribute
Thread-Index: AQHWki+GW6QuBOs2Jk6Y7g17kvFjRal3buOAgACKGYCAAC2HAA==
Date: Thu, 24 Sep 2020 19:03:54 +0000
Message-ID: <a8845e2c457c9817bb3ed315a81b3d3d76348308.camel@suse.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<1600923569-17412-4-git-send-email-bmarzins@redhat.com>
	<62ced86c81b139e6461fe0dc14207606548a652a.camel@suse.com>
	<20200924162055.GF11108@octiron.msp.redhat.com>
In-Reply-To: <20200924162055.GF11108@octiron.msp.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 050ad18b-69b3-405f-0719-08d860bc9562
x-ms-traffictypediagnostic: DBAPR04MB7301:
x-microsoft-antispam-prvs: <DBAPR04MB73013EAA1B066C7C466F4308FC390@DBAPR04MB7301.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Kt02EGrF2KWYAGRLQoMlW0fwrH4avt5xab9kbbgvmMLCGMOaL7XRiLNFUZsqvIVxsGMWfVKjSauRgvRCisBkSVXBVMxJo3ajL4j06XbPmsUd0U7Y2HPUk+T7ef0Og4rGSJ4YKignqc+ZgI9u8wS4/eIu2+ELA6jWm0Zcda7TGKuxHmnc+JMGSE/XDXwLPlABoNI+RVx7ZWK0MS5RVgJ8ALoFuKltAeaYufr4oKlyzRUFerphZVy2e/3weWRfEkUBcrfGXjJnq/UZ/tpaNQlplFJ6h/5zaRV0zfPZ1gbpkhxWFBA1QSNSIhiwIbQlRBTLMaWO3ZtAUYODD2PUb9vrGYCe31CaOeajiCgyWYnXSczFNMaKTHMpG9GDATS0kTuV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(44832011)(66476007)(71200400001)(64756008)(66946007)(91956017)(76116006)(6916009)(83380400001)(66556008)(86362001)(66446008)(54906003)(2906002)(478600001)(6512007)(316002)(5660300002)(36756003)(6486002)(8676002)(8936002)(26005)(6506007)(4326008)(2616005)(186003);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: TabDvwzJ6xPnWOpf4B1iISspmS7VQGr4e2JBj9i3TqUoIj67QDHYA9YTMs4iZ3odNJyE/uyHDgUnqkI68rOCO7abSV6gvTI5gq/suvC3RIpEubWPqZPvQGDZCqUm5XnYJo/bnZcKtoHQT8nWGwAY5yPbAldCThKySHDZGNRTbloZ7V2ZsoA9V7C3zeYYO+7BkplaqlsiNukKCKrSaqLIMasKLPc/GSp29hvpRy068zoUObfHXqVHG4NUFBdrtzA5jW7tXp1bPMIlzNAA8SpqzPmyk1dBC4w+452pzG5pK34vYfahQThRtll75SLiNbRBGXJq0Oow329lBgeuBKNXfSKjLmzt7iC8RBMFciXmlhAwwN1a+b/4RzOeajFaC9zxNtV+Qxe47s95OJmoAngpHTLHDHMJScFjrsZyf8cgnMODFf9IOSPP+mY8KJ5N2CKvsI1hVr8AogWW0rJc8j6O6dbPOkJ6YebvWGm+Qf5fFegh60jFfHx4uz9WxTC0cdYHhWZWFeWU6StkR/LnDd6lPQt7BgIqhKnO8m0R0TKCBxKnHJMvXmSaP9PBMYslRINS4oE+IZI/UpU1Ogek/qwV2cIinKLB1CI1DN9jC7r3KA/CcAjrI13GI365HJTQtllPDCsiul1/0WraVFtYElWgYQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050ad18b-69b3-405f-0719-08d860bc9562
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 19:03:54.7863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWaAXgwWIMfnnrE/RvS++6anKeFP/eWtp4D10U8oA1/L5zKSpvuYCjchp5Q7zfuRiRQoMlVtKt11G4r3T1r7xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OJ44nW002025
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] libmultipath: change log level
 for null uid_attribute
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
Content-ID: <52E1FF8B2FD10E40A98EDC27BF610344@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-24 at 11:20 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 08:06:41AM +0000, Martin Wilck wrote:
> > On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> > > 
> > > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > > index f650534f..435f2639 100644
> > > --- a/libmultipath/discovery.c
> > > +++ b/libmultipath/discovery.c
> > > @@ -2091,7 +2091,8 @@ get_uid (struct path * pp, int path_state,
> > > struct udev_device *udev,
> > >  		}
> > >  		if ((!udev_available || (len <= 0 && allow_fallback))
> > >  		    && has_uid_fallback(pp)) {
> > > -			used_fallback = 1;
> > > +			if (udev_available || !(udev && pp-
> > > > uid_attribute))
> > > +				used_fallback = 1;
> > >  			len = uid_fallback(pp, path_state, &origin);
> > >  		}
> > >  	}
> > 
> > Uff, this logic was convoluted anyway, now it's even harder to
> > grasp.
> > IIUC, if !udev, used_fallback will be set to 1, even if 
> > pp->uid_attribute is the empty string. Is that intended?
> > To make this easier to read, I'd suggest something like this:
> 
> My though was that not having a udev device is an unexpected
> situation,
> and so we should continue to log the message at an increased logging
> level.  If you're against that, it's not that important. I can
> certainly
> go with your code logic, or "if (!udev || !empty_uid_attr)" if you
> think
> it's reasonable to log at an increased level whenever the udev_device
> is
> NULL, even if the device was configured to ignore the udev database

My main concern was not the !udev case, nor the logging. It was just
that my brain choked on the complex boolean expression. My suggestion
was intended to make it somewhat easier to grok, that's all.

Cheers,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


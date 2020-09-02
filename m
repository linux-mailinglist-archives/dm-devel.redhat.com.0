Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 25D6825BB37
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:48:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-uhGbsACdPnaPf-vhtlBI2Q-1; Thu, 03 Sep 2020 02:48:49 -0400
X-MC-Unique: uhGbsACdPnaPf-vhtlBI2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15E3D1091065;
	Thu,  3 Sep 2020 06:48:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFF5B19C71;
	Thu,  3 Sep 2020 06:48:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DC4679DC2;
	Thu,  3 Sep 2020 06:48:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 082N6UB8021582 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 19:06:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8611F1014; Wed,  2 Sep 2020 23:06:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1FB8F1010
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 23:06:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B913A89D4B7
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 23:06:27 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-334-dzOJbBTgNheXjxHVNAa-EA-1; Wed, 02 Sep 2020 19:06:23 -0400
X-MC-Unique: dzOJbBTgNheXjxHVNAa-EA-1
IronPort-SDR: QL4wctpMTmT23oLNFnardApHd+jcKMH5arTC/JUF12k3p/Aaj4y+sQP3uFCZNE8t5cgINKrg/C
	4RQZb8UL27og==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="219045800"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="219045800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	02 Sep 2020 16:05:18 -0700
IronPort-SDR: 91n1Sav+cmz3ob2P7eod0AoCIV48/akeASBjVemQL95L2yVd1PyebYV0agSNiZaUv7SgZ+1vD/
	kFyfL/oj2zfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="334266928"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2020 16:05:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
	fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Wed, 2 Sep 2020 16:05:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
	fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
	(version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
	via Frontend Transport; Wed, 2 Sep 2020 16:05:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
	by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1713.5; Wed, 2 Sep 2020 16:05:18 -0700
Received: from BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21)
	by BYAPR11MB3672.namprd11.prod.outlook.com (2603:10b6:a03:fa::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22;
	Wed, 2 Sep 2020 23:05:15 +0000
Received: from BYAPR11MB3448.namprd11.prod.outlook.com
	([fe80::1084:a79c:5a4f:f115]) by
	BYAPR11MB3448.namprd11.prod.outlook.com
	([fe80::1084:a79c:5a4f:f115%5]) with mapi id 15.20.3326.025;
	Wed, 2 Sep 2020 23:05:15 +0000
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "pankaj.gupta.linux@gmail.com" <pankaj.gupta.linux@gmail.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"colyli@suse.de" <colyli@suse.de>, "jack@suse.com" <jack@suse.com>,
	"Weiny, Ira" <ira.weiny@intel.com>
Thread-Topic: flood of "dm-X: error: dax access failed" due to 5.9 commit
	231609785cbfb
Thread-Index: AQHWgULPosL8puOqlEOttLUmKO0Ls6lVjRcAgABrawA=
Date: Wed, 2 Sep 2020 23:05:15 +0000
Message-ID: <8dc419e607ffa0e2baa6bd5795b4956fb945ebad.camel@intel.com>
References: <20200902160432.GA5513@redhat.com>
	<df0203fa-7f75-53ac-8bf1-79a1c861918e@suse.de>
In-Reply-To: <df0203fa-7f75-53ac-8bf1-79a1c861918e@suse.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32)
x-originating-ip: [134.134.139.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccf70fa2-7c2b-435f-5bfc-08d84f94a768
x-ms-traffictypediagnostic: BYAPR11MB3672:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36728A6D52815B07D38C9414C72F0@BYAPR11MB3672.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIsk3oLMQJl+HkOqzL5kdjPD/v7HbGi6hr95eUDz2R679CmyeCb9ItO9nqjDMDWtpongIgfZVrVHRph2K8HaxA2poc5qzheiJvUTKfxlgt+xJBsPwn5Zk42iXWfv76CIYsRvFduwsTQVgtcaLvykrauTH8EDtVmcww4FYBb5ehihN2aNKCTq3mKfH5d8+W3b1KxeD+Ipkv4/97JGdXcIdZlreI658EC7HNFY4EJGHuhK5Mp9Vcne+fz8aenJShLrd1NG6qCvpJOTVVKKggnFRgkqiNK+CTSgElfD2pulAYPuH/+RB39Uzs8JWQpGdPeuww2b3C9FKn1htH98sNX3zA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BYAPR11MB3448.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(2616005)(5660300002)(6486002)(71200400001)(186003)(53546011)(6506007)(26005)(4326008)(66446008)(64756008)(2906002)(8936002)(36756003)(66946007)(66476007)(316002)(478600001)(6636002)(110136005)(54906003)(76116006)(6512007)(86362001)(8676002)(66556008)(83380400001)(91956017);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: BStsDV5h6/WxEvRRYUMrqmtAN7yJ3ro/k0UyQYmIjeHVcy9SnWPUgiYgQnrrgSXFoV/KWet+CChWKORRAA7YA/4TFmvGSWx0hHlJw/CuQWmTmwO1xHNg2Sz5/VAF5NfTmlLNJCfZptViuKRB+mCKY2hlDjeE2wZi7RzfaxO8v4u05Cl1IlXd1StJa09LkUc70tvY5FZ7z944SQ+D2h5/BRq9EOiyvnxAhX8637x3BfA+zCT3Yu9j2um3xCu1RieY8mEgGgjCujAIIU0UGjJrKdpH34dZZeOPwdLHrJOob6lwxeFranLAB51YtloK02SYGlCD9ucZGN+rjsMIbaFtz7ea/bIjZDkIRnysOesJyhNDwy+XZiw5QEKyISfJMo0ZMIZKXgckvLO8Xbeb5Ta+G5NlcyjdbZeEUwL4snPiKiZNFoPZ1GX1MtE18yw+L2m/kUzgyAIR0iGEvToXnQKSmTc/LWQsADoLtS1ZXqT1vzGkXdodRLBuYLXvbSvGBA3Ss69rpsyDwjYEp8YTx+i0D9RGjJRsZ+bQPMFUaeM4/cE1ke05aCE38IYNQAF5z+r6v818vw05U9Pw1ms9GOlYVi/A4ynTPqqpjCXFxOWBchE7Qmx2D3UQ/byLZW1ZoU84oi2hbaP3Q1DL7Tzd297kwA==
Content-ID: <DA97FB514C8ECD42BA421E213FBFF734@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3448.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf70fa2-7c2b-435f-5bfc-08d84f94a768
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 23:05:15.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhccGMtay0R2NsQpkCksK8+MOeYj0IdDBdJFhDdO+0NUW9Y1F96EimbwlIfr9VBR/qIXZwEZO8ITlGHygujzRSxXMHOpwYNwxu+XRZzZ0r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3672
X-OriginatorOrg: intel.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 082N6UB8021582
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 02:48:19 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] flood of "dm-X: error: dax access failed" due to 5.9
 commit 231609785cbfb
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Thu, 2020-09-03 at 00:40 +0800, Coly Li wrote:
> On 2020/9/3 00:04, Mike Snitzer wrote:
> > 5.9 commit 231609785cbfb ("dax: print error message by pr_info() in
> > __generic_fsdax_supported()") switched from pr_debug() to pr_info().
> > 
> > The justification in the commit header is really inadequate.  If there
> > is a problem that you need to drill in on, repeat the testing after
> > enabling the dynamic debugging.
> > 
> > Otherwise, now all DM devices that aren't layered on DAX capable devices
> > spew really confusing noise to users when they simply activate their
> > non-DAX DM devices:
> > 
> > [66567.129798] dm-6: error: dax access failed (-5)
> > [66567.134400] dm-6: error: dax access failed (-5)
> > [66567.139152] dm-6: error: dax access failed (-5)
> > [66567.314546] dm-2: error: dax access failed (-95)
> > [66567.319380] dm-2: error: dax access failed (-95)
> > [66567.324254] dm-2: error: dax access failed (-95)
> > [66567.479025] dm-2: error: dax access failed (-95)
> > [66567.483713] dm-2: error: dax access failed (-95)
> > [66567.488722] dm-2: error: dax access failed (-95)
> > [66567.494061] dm-2: error: dax access failed (-95)
> > [66567.498823] dm-2: error: dax access failed (-95)
> > [66567.503693] dm-2: error: dax access failed (-95)
> > 
> > commit 231609785cbfb must be reverted.
> > 
> > Please advise, thanks.
> 
> Adrian Huang from Lenovo posted a patch, which titled: dax: do not print
> error message for non-persistent memory block device
> 
> It fixes the issue, but no response for now. Maybe we should take this fix.
> 

Mike, Coly,

I applied Adrians patch, and submitted it - it is already in v5.9-rc3 -
c2affe920b0e dax: do not print error message for non-persistent memory block device

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

